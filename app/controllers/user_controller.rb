class UserController < ApplicationController
  def show
    @gifter = User.find(params[:id])
    @giftee = User.find(@gifter.giftee_id)
  end

  def secret
    password_entered = params[:password]
    @user = User.find(params[:user_id])
    @giftee = User.find(@user.giftee_id)

    if password_entered != @user.password
      @errors = ["You are not #{@user.name}! Wrong password entered."]
      respond_to do |f|
        f.js { render 'wrong_password.js.erb'}
      end
    else
      respond_to do |f|
        f.js { render 'correct_password.js.erb'}
      end
    end
  end
end
