class SessionsController < ApplicationController
  def create
      open_id_authentication
  end


  protected

    def open_id_authentication
      authenticate_with_open_id do |result, identity_url|
        if result.successful?
          if @current_user = User.find_by_identity_url(identity_url)
          else
             @current_user = User.create(:identity_url => identity_url)
          end
          successful_login
        else
          failed_login result.message
        end
      end
    end
  
  
  private
    def successful_login
      current_user = @current_user
      flash[:notice] = "You logged in sucessfully"
      redirect_to(root_url)
    end

    def failed_login(message)
      flash[:error] = message
      redirect_to(new_session_url)
    end
end
