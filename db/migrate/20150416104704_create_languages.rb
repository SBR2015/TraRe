class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.integer :language_id, null: false
      t.string :language, null: false

      t.timestamps null: false
    end

    add_index :languages, :language_id, unique: true
    add_index :languages, :language, unique: true

  end
end
