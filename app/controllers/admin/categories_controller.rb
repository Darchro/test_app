class Admin::CategoriesController < ApplicationController
  before_action :find_admin
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def index
  	@categories = Category.all
  end

  def destroy
  	@category = Category.find_by(id: params[:id])
  	@category.destroy
  	redirect_to admin_categories_path
  end 


  private
    def category_params
    	params.require(:category).permit(:name)
    end

    def find_admin
    	@admin = Admin.find_by(id: session[:admin_id])
      redirect_to admin_login_path unless @admin
    end	
end