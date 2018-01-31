class SpinsController < ApplicationController
  before_action :authenticate_user! #-> routes to the login / signup if not authenticated
  before_action :find_spin, only: [:show, :edit, :update, :destroy ]
  
  def index
    @spins = Spin.all.order("created_at DESC")
  end

  def new
    @spin = current_user.spins.build
    @shot_setup = ShotSetup.find(1)
    @shot_setups = ShotSetup.all.order("created_at DESC")
  end

  def destroy
    @spin.destroy
    redirect_to spins_path
  end

  def edit
  end

  def create
    @spin = current_user.spins.build(spin_params)
    if @spin.save
      redirect_to new_spin_shot_path(@spin)
    else
      render 'new'
    end
  end

  def show 
    @spin = Spin.includes(:shots).find(params[:id])
  end

  def update
    if @spin.update(spin_params)
      redirect_to spin_path(@spin)
    else
      render 'edit'
    end
  end



private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def spin_params
    params.require(:spin).permit(:shot1)
  end

  def find_spin
    @spin = Spin.find(params[:id])
  end
end
