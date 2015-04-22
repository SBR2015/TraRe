class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.text :sentence, null: false, default: ""
      t.boolean :is_translation, null: false, default: 0
      t.integer :owner_id
      t.integer :translator_id
      t.references :language, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
