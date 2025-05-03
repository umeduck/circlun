class ApplicationController < ActionController::API
    include RackSessionFix
    include DeviseTokenAuth::Concerns::SetUserByToken

    # CSRF保護を明示的に追加
    include ActionController::RequestForgeryProtection
    protect_from_forgery with: :null_session

    # CSRFトークンチェックをスキップ
    skip_before_action :verify_authenticity_token

    helper_method :current_user, :user_signed_in?
end
