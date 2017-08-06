class SearchesController < ApplicationController
    
    def new
        #@search ||= Search.new
        #@runs = Run.all
        if !params[:id]
            if params[:order]
                @search = Search.new
                @runs = Run.all.includes(:level, :fight, :user).paginate(page: params[:page], per_page: 10).reorder("#{params[:order]}")
            else
                @search = Search.new
                @runs = Run.all.includes(:level, :fight, :user).paginate(page: params[:page], per_page: 10).order("created_at DESC")
            end
        else
            if params[:order]
                @search = Search.find(params[:id])
                @runs =  @search.runs.paginate(page: params[:page], per_page: 10).reorder("#{params[:order]}")
            else
                @search = Search.find(params[:id])
                @runs = @search.runs.paginate(page: params[:page], per_page: 20).order('created_at ASC')
            end
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
