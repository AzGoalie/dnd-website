class StaticPagesController < ApplicationController
  def home
  	redirect_to campaigns_path unless !logged_in?
  end

  def about
  end
end
