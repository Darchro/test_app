class ArticlesController < ApplicationController
  before_action  :find_user, :only => [:index, :new, :create, :destroy]  
  def new
    @article = @user.articles.new
  end

  def create
  	@article = @user.articles.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def show
  	@article = Article.find_by(id: params[:id])
  end

  def index
  	#@articles = Article.all
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true)
  end

  def update
    @article = Article.find_by(id: params[:id])
    if @article.update(article_params)
      redirect_to admin_admins_path
    else
      render 'edit'
    end
  end

  def destroy
  	@article = @user.articles.find_by(id: params[:id])
  	@article.destroy
  	redirect_to articles_path
  end

  

  private
    def article_params
      params.require(:article).permit(:title, :content, :category_id)
    end	
  
    def find_user
      @user = User.find_by(id: session[:user_id])
      if params[:action] == 'index'
      else
        redirect_to sessions_login_path unless @user
      end
    end
end
