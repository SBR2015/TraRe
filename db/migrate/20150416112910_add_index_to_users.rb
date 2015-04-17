class AddIndexToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.index :native_language_id
      t.index :best_language_id
    end
  end
end
