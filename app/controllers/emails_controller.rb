class EmailsController < ApplicationController
  before_filter :signed_in_user

  def create
      DailyNotifier.notify(current_user).deliver
      flash[:success] = "Email sent"
      redirect_to current_user
  end

end
