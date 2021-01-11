class ArticlesController < ApplicationController
    before_action :set_art, only: [:show, :edit, :update, :destroy]
    def show
    end

    def index
        @arts=Article.all
    end
    def new
        @art=Article.new
    end

    def edit
    end

    def create
        @art=Article.new(art_params)
        if @art.save
            flash[:notice] = "Atrical was created successfully."
            redirect_to @art
        else
            render 'new'
        end
        #render plain: @art.inspect
    end

    def update
        if @art.update(art_params)
            flash[:notice] = "Atrical was updated successfully."
            redirect_to @art
        else
            render 'edit'
        end
    end
    
    def destroy
        @art.destroy
        #@art.save
        redirect_to articles_path
    end

    private
    def set_art
        @art=Article.find(params[:id])
    end

    def art_params
        params.require(:article).permit(:title, :description)
    end
end