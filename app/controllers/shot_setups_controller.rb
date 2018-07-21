class ShotSetupsController < ApplicationController
  before_action :set_shot_setup, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :js
  before_action :authenticate
  
  def authenticate
    unless ENV['HTTP_AUTH_USERNAME'].blank? or ENV['HTTP_AUTH_PASSWORD'].blank?
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['HTTP_AUTH_USERNAME'] && password == ENV['HTTP_AUTH_PASSWORD']
      end
    end
  end

  def index
    @shot_setups = ShotSetup.all.order("created_at DESC")
  end 

  def show
  end 

  def new 
    @shot_setup = ShotSetup.new
  end 

  def edit
  end 

  def create
    @shot_setup = ShotSetup.new(shot_setup_params)
    @shot_setup.save
    respond_with(@shot_setup)
  end 

  def update
    @shot_setup.update(shot_setup_params)
    flash[:notice] = 'Shot setup was successfully updated.'
    respond_with(@shot_setup)
  end 

  def destroy
    @shot_setup.destroy
    redirect_to shot_setups_url, notice: 'Shot setup was successfully destroyed.'
  end 

  private
    def set_shot_setup
      @shot_setup = ShotSetup.find(params[:id])
    end 

    def shot_setup_params
      params.require(:shot_setup).permit(:name, :angle, :hints, :example, :clock) 
    end 
end
 
