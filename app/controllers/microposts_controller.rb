class MicropostsController < ApplicationController

before_filter :authenticate
before_filter :authorized_user, :only => :destroy

    
    
    
    def create
        @banner = current_user.microposts.build(params[:banner])

        @micropost = current_user.microposts.build(params[:micropost])
            if @micropost.save || @photo.save
                redirect_to root_path, :flash => { :success => "Post Saved" }
            else
                
                @feed_items = []                        
                render 'pages/home'
                
        end
end

def destroy

    @micropost.destroy
    redirect_to root_path, :flash => { :success => "Post Gone" }


    end
    
    private
    
    
    def authorized_user
        @micropost = Micropost.find(params[:id])
        redirect_to root_path unless current_user?(@micropost.user)
        end
    
    
    
    
end