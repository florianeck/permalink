module Permalink
  module Orm
    module Base
      module ClassMethods
        def setup_permalink(orm_options, from, options)
          options.reverse_merge!(orm_options)
          options.reverse_merge!({
            :to     => :permalink,
            :unique => false,
            :force  => false
          })

          self.permalink_options = {
            :from_column_name => from,
            :to_column_name   => options[:to],
            :to_param         => [options[:to_param]].flatten,
            :unique           => options[:unique],
            :force            => options[:force]
          }
          
          self.send(:attr_accessor, :overwrite_permalink)
          
          before_validation :create_permalink
          before_save :create_permalink
        end
      end

      module InstanceMethods
        def to_param
          to_param_option = self.class.permalink_options[:to_param]

          to_param_option.compact.collect do |name|
            if respond_to?(name)
              send(name).to_s
            else
              name.to_s
            end
          end.reject(&:blank?).join("-")
        end
        
        def permalink_value_without_id
          self.permalink.to_s.gsub(/\A[0-9]{1,}-/, "")
        end  
        
        private

        def from_permalink_name
          self.class.permalink_options[:from_column_name]
        end

        def to_permalink_name
          self.class.permalink_options[:to_column_name]
        end

        def from_permalink_value
          read_attribute(from_permalink_name)
        end

        def to_permalink_value
          read_attribute(to_permalink_name)
        end
        
       


        def create_permalink
          # Getting Permalink data
          # Check overwrite
          value = self.overwrite_permalink.blank? ? self.to_param : self.overwrite_permalink
            write_attribute(to_permalink_name, "#{self.id}-#{value}".gsub(" ", "-").gsub(/[-]{1,}/, "-").downcase)
        end
      end
    end
  end
end
