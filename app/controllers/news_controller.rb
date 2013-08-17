class NewsController < FrontController
  def index
    @news_articles = NewsArticle.paginate(:page => params[:page], :per_page => params[:per_page]).latest
    @total_news = NewsArticle.count
    render 'index'
  end

  def show
    @news_article = NewsArticle.find_by_slug(params[:slug])
    render 'show'
  end
end