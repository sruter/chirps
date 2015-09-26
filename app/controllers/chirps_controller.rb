class ChirpsController < ApplicationController
  def index
    @chirps = Chirp.where(params.permit(:author))
  end

  def new
    @chirp = Chirp.new(params.permit(:author))
  end

  def edit
    @chirp = Chirp.find_by(params.permit(:author, :id))
  end

  def show
    @chirp = Chirp.find_by(params.permit(:author, :id))
  end
  
  def create
    @chirp = Chirp.new(params[:chirp].permit(:author, :body, :pic))
    if @chirp.save
      redirect_to chirp_path(@chirp)
    else
      render 'new'
    end
  end
  
  def update
    @chirp = Chirp.find(params[:id])

    if @chirp.update(params[:chirp].permit(:author, :body, :pic))
      redirect_to chirp_path(@chirp)
    else
      render 'edit'
    end
  end
  
  def destroy
    Chirp.find(params[:id]).destroy
    redirect_to chirps_path
  end

end
