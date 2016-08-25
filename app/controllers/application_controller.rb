class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken
  include ActionController::MimeResponds
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound do
    respond_to do |type|
      type.all { render :nothing => true, :status => 404 }
    end
  end
end
