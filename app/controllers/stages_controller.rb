class StagesController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    
    def new
        @run = Run.find(params[:id])
        @run.fight.stages.times { @run.stages.build }
    end
    
    def edit
        @run = Run.find(params[:id])
    end
   
    def stages_params(my_params)
        my_params.permit(:number, :description)
    end
   
    
end
