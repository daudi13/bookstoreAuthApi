class ChangeDataTypeForTotalChapters < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :total_chapters, :string
  end
end
