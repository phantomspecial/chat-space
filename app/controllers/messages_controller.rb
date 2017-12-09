class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
  end

  def new
  end

  def create
  end

end
