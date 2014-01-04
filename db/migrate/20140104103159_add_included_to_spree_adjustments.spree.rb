# This migration comes from spree (originally 20131118074808)
class AddIncludedToSpreeAdjustments < ActiveRecord::Migration
  def change
    add_column :spree_adjustments, :included, :boolean, :default => false
  end
end
