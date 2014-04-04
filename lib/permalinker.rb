require "permalinker/string_ext"
require "permalinker/orm/base"
require "permalinker/orm/active_record"

ActiveRecord::Base.send(:include, Permalinker::Orm::ActiveRecord) if defined?(ActiveRecord)
