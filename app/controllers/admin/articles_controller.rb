class Admin::ArticlesController < Admin::BaseController
	before_action :find_admin
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find_by(id: params[:id])
	end

	def edit
		@article = Article.find_by(id: params[:id])
	end

	def update
    @article = Article.find_by(id: params[:id])
    @article.tag_list = params[:tags]
    if @article.update(article_params)
      redirect_to admin_articles_path
    else
      render 'edit'
    end
  end

  def destroy
  	@article = Article.find_by(id: params[:id])
  	@article.destroy
  	redirect_to admin_articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :content, :category_id)
    end

    def find_admin
      @admin = Admin.find_by(id: session[:admin_id])
      redirect_to admin_login_path unless @admin
    end 
end