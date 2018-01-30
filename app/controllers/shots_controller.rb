class ShotsController < ApplicationController
	before_action :find_spin
  before_action :find_shot, only: [:show, :edit, :update, :destroy ]
  

  def index
    @shots = Shot.all.order("created_at DESC")
  end

  def new
  	@shot = Shot.new
  end

  def destroy
    @shot.destroy
    redirect_to shots_path
  end

  def edit
  end

  def create
    @shot = Shot.new(shot_params)
    @shot.spin_id = @spin.id
    @shot.user_id = current_user.id
    if @shot.save
      redirect_to spins_path
    else
      render 'new'
    end
  end

  def show 
  end

  def update
    if @shot.update(shot_params)
      redirect_to spins_path
    else
      render 'edit'
    end

  end

private

  def shot_params
    params.require(:shot).permit(:picture, :user_id)
  end

  def find_shot
    @shot = Shot.find(params[:id])
  end

  def find_spin 
    @spin = Spin.find(params[:spin_id])
  end
end
