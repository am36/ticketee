class Admin::StatesController < Admin::ApplicationController
  def index
    @states = State.all
  end
  
  def new
    @state = State.new
  end
end