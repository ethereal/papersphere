module ReadingListsHelper

  def self.get_shared_lists(user)
    result = []
    user.groups.each do |group|
      group.reading_lists.each do |reading_list|
        result << reading_list
      end
    end
    result
  end

end
