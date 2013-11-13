class PaperAddedNotifier < ActionMailer::Base
  default from: 'PaperSphere <papersphere2013@gmail.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.paper_added_notifier.added.subject
  #
  def added(first_name, title, reading_list)
    @first_name = first_name
    @title = title
    @reading_list = reading_list
    # send an email to each member of the reading list   
    @reading_list.reading_list_shares.each { |reading_list_share|
      @group = reading_list_share.group
      @group.group_members.each { |member|
        #if the user wants this notification
        if member.user.paper_added
          @member = member
          mail to: @member.user.email, subject: 'Paper has been added to your reading list.' 
        end
      }
    }
  end
end
