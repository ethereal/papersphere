class ReadingListShare < ActiveRecord::Base
  belongs_to :group
  belongs_to :reading_list
  attr_accessible :access_rights, :group_id, :reading_list_id
end
