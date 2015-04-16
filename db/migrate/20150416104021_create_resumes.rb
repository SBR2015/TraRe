class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.string :sentence
      t.boolean :is_translation

      t.timestamps null: false
    end
  end
end
