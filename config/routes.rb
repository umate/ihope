IHope::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users,
             path_names:  { sign_in: 'login', sign_out: 'logout'},
             controllers: { sessions: 'sessions' }

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root to: 'site#index'


  # News
  get 'news',       controller: 'cms/news_articles', action: :index, as: :cms_news
  get 'news/:slug', controller: 'cms/news_articles', action: :show,  as: :cms_news_article

  # Pages
  get ":slug",      controller: 'cms/pages',         action: :show,  as: :cms_page
end
