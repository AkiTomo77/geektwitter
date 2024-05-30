class UsersController < ApplicationController
  before_action :set_user, only: [:followings, :followers]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) 
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    if @user.id == current_user.id
      @msg = "DMしよう"
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end

      if @isRoom != true
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def followings
    @users = @user.followings
  end

  def followers
    @users = @user.followers
  end

private
  def set_user
    @user = User.find(params[:id])
  end
end
