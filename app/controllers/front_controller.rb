class FrontController < ApplicationController
  protect_from_forgery
  before_filter :set_locale


  protected

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def set_locale
    I18n.locale = session[:locale] = params[:locale] || session[:locale] || I18n.default_locale
  end
end