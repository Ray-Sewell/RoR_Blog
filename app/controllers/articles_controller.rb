class ArticlesController < ApplicationController

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
    @article = set_article
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    @article = set_article
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    @article = set_article
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article = set_article
    @article.destroy
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      return Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
