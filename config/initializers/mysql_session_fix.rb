# config/initializers/mysql_session_fix.rb
ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.connection.execute("SET SESSION sql_require_primary_key = DEFAULT") rescue nil
  end
  