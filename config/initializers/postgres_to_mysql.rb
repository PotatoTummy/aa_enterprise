ActiveSupport.on_load :active_record do
  module ActiveRecord
    module ConnectionAdapters
      class TableDefinition
        def jsonb(*args, **options)
          args.each { |name| column(name, :json, **options) }
        end
      end
    end
  end
end 