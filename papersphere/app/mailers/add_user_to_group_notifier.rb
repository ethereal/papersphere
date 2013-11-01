class AddUserToGroupNotifier < ActionMailer::Base
  default from: 'PaperSphere <ana.andro02@gmail.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.add_user_to_group_notifier.added.subject
  #
  def added(user, group)
    @user = user
    @group = group
    @greeting = "Hi"
    mail to: @user.email, subject: 'You have been added to the group.'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.add_user_to_group_notifier.removed.subject
  #
  def removed(user, group)
    @user = user
    @group = group
    @greeting = "Hi"
    mail to:  @user.email, subject: 'You have been removed from the group.'
  end
end
