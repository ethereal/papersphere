class ReadingListPaper < ActiveRecord::Base
  belongs_to :reading_list
  belongs_to :paper
  attr_accessible :paper_id, :reading_list_id

  def self.add_paper_to_reading_list(reading_list, paper)
    transaction do
      existing_paper = Paper.find_by_paper_code(paper.paper_code)
      if existing_paper.nil?
        paper.save!
      else
        paper = existing_paper
      end

      reading_list_paper = ReadingListPaper.new
      reading_list_paper.paper = paper
      reading_list_paper.reading_list = reading_list
      reading_list_paper.save!
      return reading_list_paper
    end
  end

end
