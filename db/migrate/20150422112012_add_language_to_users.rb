class AddLanguageToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :native_language_id
      t.integer :best_language_id
    end
  end
end
