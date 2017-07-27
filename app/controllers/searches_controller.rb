class SearchesController < ApplicationController
    
    def new
        #@search ||= Search.new
        #@runs = Run.all
        
        if !params[:id]
            @search = Search.new
            @runs = Run.all
        else
            @search = Search.find(params[:id])
        end
    end
    
    def create
        @search = Search.create!(search_params)
        redirect_to root_path(id: @search.id), method: :post
    end
    
    def update
         @search = Search.find(params[:id])
         @search.update_attributes(search_params)
         redirect_to root_path(id: @search.id)
    end
  
    def show
        @search = Search.find(params[:id])
    end
    
    private
    
    def search_params
        params.require(:search).permit(:keywords, :level_id, :fight_id, :captain_class, :server )
    end
end
