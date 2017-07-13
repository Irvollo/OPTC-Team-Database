class AddAdminToUsers < ActiveRecord::Migration
  def change
    #Add default for readibility
    add_column :users, :admin, :boolean, default: false
  end
end
