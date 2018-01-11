class StaticPagesController < ApplicationController
   include Pundit
    after_action :verify_authorized, except: [:welcome]
  def welcome
  end
end
