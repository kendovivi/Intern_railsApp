require 'will_paginate/array'

class PostsController < ApplicationController
  
  http_basic_authenticate_with name:"admin", password: "admin", except: [:index, :show]


  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
  	@post = Post.find(params[:id])
    @comments = @post.comments.paginate(page: params[:page], per_page: 5)
  end

  def index
    @posts = Post.search(params[:search],params[:tag])
    @posts = @posts.paginate(page: params[:page], per_page: 10)
    @tags = Tag.find(:all)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :text, :avatar, tag_ids: []))
      redirect_to @post
    else
      render 'edit'
    end  
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'post delete successful'
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
