class ReactionsController < ApplicationController
  before_action :authenticate_user!

  def create
    tweet = Tweet.find(params[:tweet_id])
    reaction = tweet.reactions.build(reaction_params) 
    reaction.user_id = current_user.id
    if reaction.save
      flash[:notice] = "コメントどね"
      redirect_to  controller: :tweets, action: :index
    else
      flash[:notice] = "リアクションは1文字でね💕💕どんまい"
      redirect_back(fallback_location: root_path) 
    end
  end

  def destroy
    @reaction = @tweets.reactions.find(params[:id])
    @reaction.destroy
    redirect_to @tweets, notice: 'Reaction removed successfully.'
  end

  private
    def reaction_params
      params.require(:reaction).permit(:emoji)
    end
end