class VotesController < ApplicationController

  before_action :load_post_and_vote

  def up_vote
    update_vote(1)
    redirect_to :back
  end

  def down_vote
    update_vote(-1)
    redirect_to :back
  end

  private

  def load_post_and_vote
    @post = Post.find(params[:post_id])
    @topic = @post.topic
  end

  def update_vote(new_value)
    if @vote
      authorize @vote, :update?
      @vote.update_attribute(:vote, new_value) #finding the vote by post and user. if it exists it updates it, if not it creates one.
    else
      @vote = current_user.votes.build(value: new_value, post: @post)# but only one vote per post, per user. 
      authorize @vote, :create?
      @vote.save
    end    
  end
end