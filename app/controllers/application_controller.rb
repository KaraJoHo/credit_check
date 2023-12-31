class ApplicationController < ActionController::Base
rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404
    render file: "#{Rails.root}/public/404.html", status: 404
  end

  private
  def error_message(errors)
    errors.full_messages.join(", ")
  end

end
