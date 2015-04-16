class AddIndexToResumes < ActiveRecord::Migration
  def change
    change_table :resumes do |t|
      t.index :owner_id
      t.index :translator_id
      t.index :language_id
      t.index :wanted_language_id
    end
  end
end
