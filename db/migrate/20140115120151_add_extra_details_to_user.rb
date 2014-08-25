class AddExtraDetailsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :subscribed, :boolean, :default => false
  	add_column :users, :stripeid, :stripe
  end
end
