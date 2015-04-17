class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :sentence, null: false, default: ""
      t.boolean :is_translation, null: false, default: 0
      t.integer :owner_id, null: false
      t.integer :translator_id, null: false
      t.references :language, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
