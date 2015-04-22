class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.text :sentence, null: false, default: ""
      t.boolean :is_translation, null: false, default: false
      t.integer :owner_id
      t.integer :translator_id
      t.integer :language_id

      t.timestamps null: false
    end
  end
end
