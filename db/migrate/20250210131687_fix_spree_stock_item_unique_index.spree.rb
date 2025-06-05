class FixSpreeStockItemUniqueIndex < ActiveRecord::Migration[8.0]
  def up
    remove_index :spree_stock_items, name: "stock_item_by_loc_var_id_deleted_at" if index_exists?(:spree_stock_items, [:stock_location_id, :variant_id, :deleted_at], name: "stock_item_by_loc_var_id_deleted_at")
    add_index :spree_stock_items, [:stock_location_id, :variant_id], name: "stock_item_by_loc_var_id", unique: true, where: "deleted_at IS NULL"
  end

  def down
    remove_index :spree_stock_items, name: "stock_item_by_loc_var_id" if index_exists?(:spree_stock_items, [:stock_location_id, :variant_id], name: "stock_item_by_loc_var_id")
    add_index :spree_stock_items, [:stock_location_id, :variant_id, :deleted_at], name: "stock_item_by_loc_var_id_deleted_at", unique: true
  end
end