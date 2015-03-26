class CommentsController < ApplicationController

  # enables the controller to respond to both HTML and JavaScript
  respond_to :html, :js

  # This method simply instantiates an empty instance of Comment
  def new
    @post = Post.find(params[:post_id])
    @comments = @post.comments.paginate(page: params[:page], per_page: 10)
    @comment = Comment.new
    authorize @comment 
  end

  # This is for when the user clicks save/submit on web form, and 'create' method is called
  # This method will either save to db or return error to user
  # Unlike 'new method' this does not have a corresponding view.
  def create
    @post = Post.find(params[:post_id]) 
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    @topic = @post.topic
    @new_comment = Comment.new 


    authorize @comment 
    if @comment.save
      flash[:notice] = "Comment was saved successfully."
    else
      flash[:error] = "Error saving the comment. Please try again."
    end

    respond_with(@comment) do |f|
      f.html { redirect_to [@topic, @post] }
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])

    @comment = @post.comments.find(params[:id])
    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
    end

    respond_with(@comment) do |f|
      f.html { redirect_to [@topic, @post] }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end


end