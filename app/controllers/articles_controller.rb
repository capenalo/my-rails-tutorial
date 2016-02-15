class ArticlesController < ApplicationController
  
  http_basic_authenticate_with name: "camila", password: "camila", except: [:index, :show]
  
  #List all articles
  def index
    @articles = Article.all
  end
  
  #Read article
  def show
    @article = Article.find(params[:id])
  end
  
  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end
  
  #Create Article
  def create
    @article = Article.new(article_params)
 
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end
  
  #Update Article
  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
  
  #Delete Article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
