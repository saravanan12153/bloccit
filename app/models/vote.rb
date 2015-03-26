class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid vote."}

  # to rank posts after each time a vost is cast
  after_save :update_post

  def up_vote?
    value == 1
  end

  def down_vote?
    value == -1
  end
  
  private

  def update_post
    post.update_rank  #removed self
  end
end