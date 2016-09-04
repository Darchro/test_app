class SessionsController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	user = User.find_by(name: params["user"]["name"])
  	return render :new unless user
		if user.authenticate(params["user"]["password"])
			# redirect_to "http://baidu.com"
      session[:user_id] = user.id
			redirect_to articles_path
		else
		  render :new
		end
  end

end
