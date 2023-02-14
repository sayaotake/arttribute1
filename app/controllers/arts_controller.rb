class ArtsController < ApplicationController
    def index
        @arts = Art.all
    end

    def abc
        @art = Art.find(params[:id])
        @comments = @art.comments
        @comment = Comment.new
    end
    def new
        @art = Art.new
    end

    def create
        art = Art.new(art_params)
        art.user_id = current_user.id
        if art.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @arts = Art.all
        @art = Art.find(params[:id])
        @comments = @art.comments
        @comment = Comment.new
    end

    def edit
        @art = Art.find(params[:id])
    end

    def update
        art = Art.find(params[:id])
            if art.update(art_params)
            redirect_to :action => "show", :id => art.id
            else
            redirect_to :action => "new"
            end
    end

    def destroy
        art = Art.find(params[:id])
        art.destroy
        redirect_to action: :index
    end
    

    private
    def art_params
        params.require(:art).permit(:title, :artist, :about, :address, :image, :lat, :lng)
    end
end
