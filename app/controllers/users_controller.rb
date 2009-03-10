class UsersController < ApplicationController
	
	def update
	  puts params.to_yaml
	  user = User.find(params[:id])
	  user.update_attributes(:yahoo_login => params[:user][:yahoo_login])
	  redirect_to root_url
	end 

end