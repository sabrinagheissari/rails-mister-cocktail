class CocktailsController < ApplicationController
before_action :cocktail_lookup, only: [:show, :destroy, :update]
# before_action :cocktail_params, only: [:create, :update]

  def index
    @cocktails = Cocktail.all
    @cocktail = Cocktail.new
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    # authorize @cocktail
    unless @cocktail.name.nil?
      if @cocktail.save
        redirect_to cocktail_path(@cocktail)
      else
        render :index
      end
    else
      render :index
    end
  end

  def edit
  end

  def update
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def cocktail_lookup
    @cocktail = Cocktail.find(params[:id])
  end
end
