class AddIndeciesToGroups < ActiveRecord::Migration
  def change
    add_index :groups, :owner_id
  end
end
