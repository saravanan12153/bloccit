class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :votes, dependent: :destroy
  has_many :posts
  has_many :comments
  has_many :favorites, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  # takes 'post' object and returns a 'favorite' object if the 'post' arg has associated record
  # in the 'favorties' table
  def favorited(post)
    self.favorites.where(post_id: post.id).first
  end

  def role?(base_role)
    role == base_role.to_s
  end

  def voted(post)
    self.votes.where(post_id: post.id).first
  end

  def self.top_rated
    self.select('users.*'). # select all attributes of the user
        select('COUNT(DISTINCT comments.id) AS comments_count'). # count the comments made by the user
        select('COUNT(DISTINCT posts.id) AS posts_count'). #count the posts made the user
        select('COUNT(DISTINCT comments.id) + COUNT(DISTINCT posts.id) AS rank'). # add comment no. to post no. and label sum as 'rank'
        joins(:posts). # ties the posts table to users table, via user_id
        joins(:comments). # tiles comments table to users table, via user_id
        group('users.id'). # instruct db to group results so each user will be returned in a distint row
        order('rank DESC') # instruct db to order results in descending order, by rank we created in query. (rank = comment count + post count)
  end

end