class ListSharedNotifier < ActionMailer::Base
   default from: 'PaperSphere <papersphere2013@gmail.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.list_shared_notifier.shared.subject
  #
  def shared(firstname, reading_list_name, group)
    @firstname = firstname
    @reading_list_name = reading_list_name
    @group = group
 logger.info "notifier before loop "
    # send an email to each member of the reading list     
    @group.group_members.each { |member|
      # if the user wants this notification
     # if member.user.list_shared
        @member = member
        mail to: @member.user.email, subject: 'Reading list has been shared with you.' 
   #   end
    }
  end
end
