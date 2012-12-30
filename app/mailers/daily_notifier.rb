class DailyNotifier < ActionMailer::Base
  add_template_helper UsersHelper

  default from: "recipesocial.noreply@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.daily_notifier.notify.subject
  #
  def notify(user)
    @recipes = Recipe.recent
    @microposts = Micropost.recent
    @greeting = "Hi #{user.name},"

    mail to: "johnrellis85@yahoo.ie", subject: "Your Daily Menu From Recipe Social"
  end
end
