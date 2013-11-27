class AddIndeciesToReadingLists < ActiveRecord::Migration
  def change
    add_index :reading_lists, :user_id
  end
end
