class TweetsController < ApplicationController
before_action :authenticate_user!

  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    tweet = Tweet.new(tweet_params)

    tweet.user_id = current_user.id

    if tweet.save
      flash[:notice] = '投稿どね'
      redirect_to :action => "index"     
    else
      flash[:notice] = '投稿できないよ。どんまい'
      redirect_to :action => "new"
    end
  end

  def show
    @tweet = Tweet.find(params[:id])

    @comments = @tweet.comments
    @comment = Comment.new
    @reactions = @tweet.reactions
    @reaction = Reaction.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      flash[:notice] = '編集どね'
      redirect_to :action => "show", :id => tweet.id
    else
      redirect_to :action => "new"
    end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    flash[:notice] = '削除どね'
    redirect_to action: :index
  end
  
  private
  def tweet_params
    params.require(:tweet).permit(:body, :image, :audio, :video, :level)
  end
end
