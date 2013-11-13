class PaperAddedNotifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.paper_added_notifier.added.subject
  #
  def added
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
