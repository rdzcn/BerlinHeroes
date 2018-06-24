class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    flash[:notice] =  t(:hello_flash)
  end
end
