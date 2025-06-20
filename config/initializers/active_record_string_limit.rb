ActiveSupport.on_load :active_record do
  begin
    # Set session-level variables instead of global
    ActiveRecord::Base.connection.execute("SET SESSION innodb_strict_mode=0;")
    ActiveRecord::Base.connection.execute("SET SESSION sql_mode='NO_ENGINE_SUBSTITUTION';")
  rescue ActiveRecord::StatementInvalid => e
    # Log the error but don't fail if we can't set these variables
    Rails.logger.warn "Unable to set MySQL session variables: #{e.message}"
  end
  
  # module ActiveRecord
  #   module ConnectionAdapters
  #     class AbstractMysqlAdapter
  #       NATIVE_DATABASE_TYPES[:string] = { name: "varchar", limit: 191 }
  #     end
  #   end
  # end
end 