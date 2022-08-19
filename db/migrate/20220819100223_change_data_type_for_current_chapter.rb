class ChangeDataTypeForCurrentChapter < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :current_chapter, :string
  end
end
