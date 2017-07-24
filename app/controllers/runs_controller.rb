class RunsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    
    def create
        @run = current_user.runs.create(run_params)
        if @run.save 
            flash[:success] = "Run created!"
            redirect_to root_url
        else
            
        end
    end
    
    def destroy
    end
    
    def new
        @run = Run.new
    end
    
    
      #Search for runs
  def index
    @runs = Run.all
    if params[:search]
      @posts = Run.search(params[:search]).order("created_at DESC")
    else
      @posts = Run.all.order('created_at DESC')
    end
  end
    
    private
    
    def run_params
        params.require(:run).permit(:fight_id,:captain_class, :description ,:youtube_url, :title, :server)
    end
    
end
