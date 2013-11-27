class AddIndeciesToReadingListShares < ActiveRecord::Migration
  def change
    add_index :reading_list_shares, :group_id
    add_index :reading_list_shares, :reading_list_id
  end
end
