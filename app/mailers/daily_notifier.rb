class DailyNotifier < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.daily_notifier.notify.subject
  #
  def notify
    @greeting = "Hi"

    mail to: "johnrellis85@yahoo.ie"
  end
end
