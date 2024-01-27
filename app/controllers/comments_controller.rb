class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    tweet = Tweet.find(params[:tweet_id])
    comment = tweet.comments.build(comment_params) 
    comment.user_id = current_user.id
    if comment.save
      flash[:notice] = "コメントどね"
      redirect_to  controller: :tweets, action: :index
    else
      flash[:notice] = "コメントできません。どんまい"
      redirect_back(fallback_location: root_path) 
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end
end
