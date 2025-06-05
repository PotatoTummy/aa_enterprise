ActiveSupport.on_load :active_record do
  ActiveRecord::Base.connection.execute("SET GLOBAL innodb_strict_mode=0;")
  ActiveRecord::Base.connection.execute("SET GLOBAL sql_mode='NO_ENGINE_SUBSTITUTION';")
  
  module ActiveRecord
    module ConnectionAdapters
      class AbstractMysqlAdapter
        NATIVE_DATABASE_TYPES[:string] = { name: "varchar", limit: 191 }
      end
    end
  end
end 