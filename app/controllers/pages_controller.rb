class PagesController < FrontController

  def show
    @page = Page.find_by_slug(params[:slug])
    not_found unless @page

    render 'show'
  end
end