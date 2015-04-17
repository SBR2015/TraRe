class AddRealnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :realname, :string, null: false, default: ""
  end
end
