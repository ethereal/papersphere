class AddPaperCountToPapers < ActiveRecord::Migration
  def change
    add_column :papers, :paper_count, :integer, :default => 0
  end
end
