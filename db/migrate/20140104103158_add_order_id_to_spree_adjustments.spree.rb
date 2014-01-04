# This migration comes from spree (originally 20131118043021)
class AddOrderIdToSpreeAdjustments < ActiveRecord::Migration
  def change
    add_column :spree_adjustments, :order_id, :integer
    add_index :spree_adjustments, :order_id
  end
end
