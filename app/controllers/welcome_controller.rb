class WelcomeController < ApplicationController
  autocomplete :category, :name
  def show
     @question = Question.new
      @category = Category.new
      @categories = Category.all
      puts "BLEEP BLOOP BLEEP BLEEP"
  end
end
