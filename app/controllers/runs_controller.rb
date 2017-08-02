class RunsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy
    
    def create
        @run = current_user.runs.create(run_params)
        if @run.save 
            flash[:success] = "Run created!"
            redirect_to root_url
        else
            
        end
    end
    
    def destroy
      @run.destroy
      flash[:success] = "Run deleted"
      redirect_to request.referrer || root_url
    end
    
    def new
        @run = Run.new
    end
    
    def update
        @run = Run.find(params[:id])
        @run.update_attributes(run_params)
        redirect_to @run
    end
    
    #Show the run video
    def show 
      @run = Run.find(params[:id])
      @stages = @run.stages
      if @run.nil?
        redirect_to root_url
      end
    end
    
    
      #Search for runs
  def index
    redirect_to root_url
    @runs = Run.all
    if params[:search]
      @posts = Run.search(params[:search]).order("created_at DESC")
    else
      @posts = Run.all.order('created_at DESC')
    end
  end
  
  def upvote 
    @run = Run.find(params[:id])
    @run.upvote_by current_user
    redirect_to :back
  end  

  def downvote
    @run = Run.find(params[:id])
    @run.downvote_by current_user
    redirect_to :back
  end
    
    private
    
    def run_params
        params.require(:run).permit(:fight_id,:captain_class, :description ,:youtube_url, :title, :server, :level_id, stages_attributes: [ :id, :run_id , :number, :description ])
    end
    
    def correct_user
      @run = current_user.runs.find_by(id: params[:id])
      redirect_to root_url if @run.nil?
    end
    
end
