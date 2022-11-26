class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.create(toy_params)
    render json: toy, status: :created
  end

  def update
    toy = Toy.find_by(id: params[:id])
    toy.update(toy_params)

    render json: toy
  end

  def destroy
    toy = Toy.find_by(id: params[:id])
    toy.destroy
    head :no_content
  end

  private

  def toy_params
    params.permit(:name, :image, :likes)
  end
end

# Add a new toy when the toy form is submitted
# How I debugged:
# byebug
# toy = Toys.create(toy_params)
#internal server error
# NameError (uninitialized constant ToysController::Toys):
#toys is uninitialized
#soln Toys to be Toy

# Update the number of likes for a toy
# How I debugged:
#console error alert unhandled rejection
#fetch got no response(no-content)
#soln add a render of the update toy

# Donate a toy to Goodwill (and delete it from our database)
# How I debugged:
#terminal error ActionController::RoutingError (No route matches [DELETE] "/toys/2"):
#soln add the :destroy
