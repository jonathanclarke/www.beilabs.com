class PostsController < ApplicationController

  def show
    @post = Post.find_by_permalink(params[:id])
  end

end

