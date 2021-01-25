class ArticlesController < ApplicationController

    before_action :set_art, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :delete]

    def show
    end

    def index
        @arts=Article.paginate(page: params[:page], per_page: 5)
    end

    def new
        @art=Article.new
    end

    def edit
    end

    def create
        @art=Article.new(art_params)
        @art.user=current_user
        #nd(@art.user_id)
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

    def require_same_user
        if current_user != @art.user && !current_user.admin?
            flash[:alert] = "you can only edit/delete your articles"
            redirect_to @art
        end
    end

end