class BlogPostsController < ApplicationController
   before_action :set_blog_post, only: [:edit, :update , :destroy]
   before_action :authenticate_user!, except: [:show, :index]
   
   def index
       @blog_posts = user_signed_in? ? BlogPost.sorted : BlogPost.published
   end
   
     
    def show
        @blog_post = BlogPost.find(params[:id])
    end
    
    
    def new
       @blog_post = BlogPost.new 
    end
    
    def create
       @blog_post = BlogPost.new(blog_post_params)
       if @blog_post.save
           redirect_to @blog_post
       else
           render :new, status: :unprocessable_entity
       end
    end
    
    def edit
      @blog_post = BlogPost.find(params[:id])  
    end
    
    def update
       @blog_post = BlogPost.find(params[:id])
       if @blog_post.update(blog_post_params)
            redirect_to @blog_post
       else
            render :edit, status: :unprocessable_entity
       end
    end
    
    def destroy
       @blog_post = BlogPost.find(params[:id])
       if @blog_post.destroy
           redirect_to root_path
       else
           render :edit, status: :unprocessable_entity
       end
    end
    
    private
    def blog_post_params
       params.require(:blog_post).permit(:title, :body, :published_at) 
    end
    
    private
    def set_blog_post
        if user_signed_in?
            @blog_post = BlogPost.find(params[:id])
        else
            @blog_post = BlogPost.published.find(params[:id])
        end
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end
    
    def authenticate_user!
       redirect_to new_user_session_path, alert: "Kanka hayda sen daha login olmamışsın ki neler yapmaya kalkıyorsun" unless user_signed_in? 
    end
end