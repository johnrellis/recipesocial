scheduler = Rufus::Scheduler.start_new

# Send the digest every day at noon
scheduler.cron("00 08 * * *") do
  User.all.each do |user|
    DailyNotifier.notify(user).deliver
  end
end