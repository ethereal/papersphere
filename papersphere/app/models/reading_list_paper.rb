class ReadingListPaper < ActiveRecord::Base
  belongs_to :reading_list
  belongs_to :paper
  has_many :comments
  has_many :recent_comments,
    class_name: "Comment",
    order: "created_at DESC",
    limit: 10
  
  attr_accessible :paper_id, :reading_list_id

  TXN_INCOMPLETE = :rlp_txn_incomplete
  TXN_INVALID_READING_LIST = :rlp_txn_invalid_reading_list
  TXN_PAPER_ALREADY_IN_READING_LIST = :rlp_txn_paper_in_list
  TXN_SUCCESSFUL = :rlp_txn_success

  def add_paper_to_reading_list(paper, reading_list_id)
    status = TXN_INCOMPLETE
    transaction do
      reading_list = nil
      begin
        reading_list = ReadingList.find(reading_list_id)
      rescue ActiveRecord::RecordNotFound
        status = TXN_INVALID_READING_LIST
        raise ActiveRecord::Rollback
      end

      reading_list.papers.each do |p|
        if p.paper_code == paper.paper_code
          status = TXN_PAPER_ALREADY_IN_READING_LIST
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
      status = TXN_SUCCESSFUL
    end

    status
  end
  
  def self.reading_list_paper_for(reading_list_id, paper_id)
    ReadingListPaper.where(reading_list_id: reading_list_id, paper_id: paper_id)[0]
  end
  
end
