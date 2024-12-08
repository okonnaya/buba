class ResponsesController < ApplicationController
  def create
    @response = Response.new(response_params)
    if @response.save
      redirect_to root_path + '#W_5', notice: "спасибо!!!"
    else
      flash[:notice] = @response.errors.first.type
      redirect_to root_path + '#error-messages'
    end
  end

  def destroy
    @admin = cookies[:carinasuper] == 'kitten'
    
    if @admin
      @response = Response.find(params[:id])
      @response.destroy
    end

    redirect_to root_path + '#W_5'
  end

  private

  def response_params
    params.require(:response).permit(:email, :message)
  end
end
