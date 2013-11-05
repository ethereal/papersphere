module ReadingListsHelper
  
  OWNER = :access_owner
  READWRITE = :access_readwrite
  READONLY = :access_readonly
  NONE = :access_none

  def self.get_shared_lists(user)
    result = []
    user.groups.each do |group|
      group.reading_lists.each do |reading_list|
        result << reading_list
      end
    end
    result
  end
  
  def self.has_access(reading_list, user, requested_access_rights)
    access_rights = get_shared_list_access_rights(reading_list, user)
    
    if requested_access_rights == OWNER
      if access_rights == OWNER
        return true
      end
      return false
    end
    
    if requested_access_rights == READWRITE
      if access_rights == OWNER or
         access_rights == READWRITE
        return true
      end
      return false
    end
    
    if requested_access_rights == READONLY
      if access_rights == OWNER or
         access_rights == READWRITE or
         access_rights == READONLY
        return true
      end
      return false
    end
    
    if requested_access_rights == NONE
      return true
    end
    
    return false
  end
  
  def self.get_shared_list_access_rights(reading_list, user)
    access_rights = []
    if reading_list.user == user
      return OWNER
    end
    reading_list.reading_list_shares.each do |share|
      if share.group.users.include? user
        access_rights << share.access_rights
      end
    end
    return get_highest_access_right(access_rights)
  end
  
  def self.get_highest_access_right(access_rights)
    if access_rights.include? 'owner'
      return OWNER
    end
    if access_rights.include? 'readwrite'
      return READWRITE
    end
    if access_rights.include? 'readonly'
      return READONLY
    end
    return NONE
  end

end
