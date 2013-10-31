class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :reading_list_paper_id

      t.timestamps
    end
  end
end
