require 'will_paginate/array'

class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Create post successfully!"
      redirect_to post_path(@post.id)
    else
      render 'new'
    end
  end

  def show
  	@post = Post.find(params[:id])
    @comment = @post.comments.build
    @comments = @post.comments.paginate(page: params[:page], per_page: 5)
  end

  def index
    @posts = Post.search(params[:search],params[:tag])
    if params[:tag]
      flash.now[:notice] = "Are you looking for "+ Tag.find(params[:tag]).name + "?"
    end

    @posts = @posts.paginate(page: params[:page], per_page: 6)
    @tags = Tag.find(:all)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    params[:post][:tag_ids] ||= []
    if @post.update(params[:post].permit(:title, :text, :avatar, tag_ids: []))
      redirect_to @post
      flash[:success] = "Update success!"
    else
      render 'edit'
    end  
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'Delete post successfully!'
    redirect_to posts_path
  end

  private
    def post_params
      params.fetch(:post).permit(:title, :text, :avatar, tag_ids: [])
    end

    def set_tagArr(tag_arr)
      str = ''
      tag_arr.each do |tag|
        unless tag == '0'
          str += tag + ';'
        end
      end
      return str;
    end

end
