class TippersController < ApplicationController
  def index
    @tippers = Tipper.all
  end

  def show
    @tipper = Tipper.find(params[:id])
  end

  def new
    @tipper = Tipper.new
    render('_form')
  end

  def create
    @tipper = Tipper.new(tipper_params)
    if @tipper.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @tipper = Tipper.find(params[:id])
  end

  def update
   @tipper = Tipper.find(params[:id])
   if @tipper.update_attributes(tipper_params)
    redirect_to(:action => 'show', :id => @tipper.id)
   else
    render('index')
    end
  end

  def delete
    @tipper = Tipper.find(params[:id]).delete
  end

  def destroy
    @tipper = Tipper.find(params[:id]).destroy
    redirect_to(:action => 'index')
  end

  private
  def tipper_params
    params.require(:tipper).permit(:name, :email, :password, :password_confirmation)
  end
end
