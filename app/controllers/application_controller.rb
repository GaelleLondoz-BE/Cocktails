class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource_or_scope)
    @cocktails_i_made = current_user.cocktails
    if @cocktails_i_made.count > 0
      cocktails_path
    else
      new_cocktail_path
    end
    
  end

  def after_sign_up_path_for(resource_or_scope)
     new_cocktail_path
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end
end
