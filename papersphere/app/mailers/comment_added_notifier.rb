class CommentAddedNotifier < ActionMailer::Base
  default from: 'PaperSphere <papersphere2013@gmail.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_added_notifier.added.subject
  #
  def added(comment)
    @comment = comment
    @reading_list = @comment.reading_list_paper.reading_list
    @reading_list.reading_list_shares.each { |reading_list_share|
      @group = reading_list_share.group
      @group.group_members.each { |member|
        #if the user wants this notification
        if member.user.comment_added
          @member = member
          mail to: @member.user.email, subject: 'New comment has been added.' 
        end
      }
    }
  end
end
