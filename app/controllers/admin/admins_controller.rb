class Admin::AdminsController < Admin::BaseController
  
  def new
  end

  def create
  	admin = Admin.find_by(name: params["admin"]["name"])
  	return render :new unless admin
		if admin.authenticate(params["admin"]["password"])
      session[:admin_id] = admin.id
			redirect_to admin_articles_path
		else
		  render :new
		end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to admin_login_path
  end


end
