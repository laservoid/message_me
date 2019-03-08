class ChatroomController < ApplicationController
  before_action :require_user

  def home
    @message = Message.new
    @messages = Message.custom_display
  end


end
