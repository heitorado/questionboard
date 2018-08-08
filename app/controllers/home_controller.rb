class HomeController < ApplicationController
  def index
    # Passes the empty question object to be used by the creation form.
    @question = Question.new
  end
end
