class SearchesController < ApplicationController
  def searche
    @word = params[:word]
    @range = params[:range]
    # binding.pry
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end



  end

end
