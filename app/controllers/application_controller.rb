class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :message
  helper_method :chatrooms
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :image, :description])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :image, :description])
  end

  def message
    @message = Message.new
  end

  def chatrooms
    @chatrooms = []
    Chatroom.all.each do |chatroom|
      if
        current_user == chatroom.receiver || current_user == chatroom.asker
        @chatrooms << chatroom
      end
    end
    @chatrooms
  end

end
