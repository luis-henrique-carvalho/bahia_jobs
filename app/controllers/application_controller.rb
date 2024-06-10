class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = I18n.t('errors.messages.unauthorized')
    redirect_to(request.referrer || root_path)
  end
end
