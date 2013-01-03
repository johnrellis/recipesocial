scheduler = Rufus::Scheduler.start_new

# Send the digest every day at noon
scheduler.cron("0 21 * * *") do
  User.all.each do |user|
    DailyNotifier.notify(user).deliver
  end
end