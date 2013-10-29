class ReadingListPaper < ActiveRecord::Base
  belongs_to :reading_list
  belongs_to :paper
  attr_accessible :paper_id, :reading_list_id

  def add_paper_to_reading_list(paper, reading_list)
    return_status = false
    transaction do
      reading_list.papers.each do |p|
        if p.paper_code == paper.paper_code
          raise ActiveRecord::Rollback
        end
      end

      existing_paper = Paper.find_by_paper_code(paper.paper_code)
      if existing_paper.nil?
        paper.save!
      else
        paper = existing_paper
      end

      self.paper = paper
      self.reading_list = reading_list
      self.save!
      return_status = true
    end
    return_status
  end

end
