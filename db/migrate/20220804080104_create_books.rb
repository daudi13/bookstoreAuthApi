class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.references :user, null: false, foreign_key: true
      t.string :author
      t.string :title
      t.string :genre
      t.integer :current_chapter
      t.integer :total_chapters

      t.timestamps
    end
  end
end
