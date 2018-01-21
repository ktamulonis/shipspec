class ShotsController < ApplicationController
	before_action :find_shot, only: [:show, :edit, :update, :destroy ]
  def index
    @shots = Shot.all.order("created_at DESC")
  end

  def new
  	@shot = current_user.spin.shots.build
  end

  def destroy
    @shot.destroy
    redirect_to shots_path
  end

  def edit
  end

  def create
    @shot = current_user.spin.shots.build(shot_params)
    if @shot.save
      redirect_to shot_path(@shot)
    else
      render 'new'
    end
  end

  def show 
  end

  def update
    if @shot.update(shot_params)
      redirect_to shot_path(@shot)
    else
      render 'edit'
    end

  end

private

  def spin_params
    params.require(:shot).permit(:picture)
  end

  def find_shot
    @shot = Shot.find(params[:id])
  end
end
