class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :code, null: false, limit: 2

      t.timestamps null: false
    end

    add_index :languages, :code, unique: true

  end
end
