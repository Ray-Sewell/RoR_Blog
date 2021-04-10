class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = set_article
  end

  def new
    @article = Article.new
  end

  def edit
    @article = set_article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: "Your article was created!"
    else
      render :new
    end
  end

  def update
    @article = set_article
    if @article.update(article_params)
      redirect_to @article, notice: "Your article was updated!"
    else
      render :edit
    end
  end

  def destroy
    @article = set_article
    @article.destroy
    redirect_to root_path, info: "Article was destroyed."
  end

  private
    def set_article
      return Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :body)
    end
end
