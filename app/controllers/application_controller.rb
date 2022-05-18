class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to members_path
    else
      render action: :new
    end
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :family_name_kana, :first_name, :first_name_kana, :birthday])
  end
end
