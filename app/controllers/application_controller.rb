class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

  protected


  def configure_permitted_parameters
      if resource_class == User
            devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email])
            devise_parameter_sanitizer.permit(:sign_in,keys:[:name,:email])
            devise_parameter_sanitizer.permit(:account_update,keys:[:name,:email])
      end
  end
end