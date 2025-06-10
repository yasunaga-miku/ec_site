class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    #ログイン後の遷移先を設定
    def after_sign_in_path_for(resource)
        case resource
        when Admin
            books_path
        when User
            mypage_path(resource)
        end
    end

    # def after_sign_in_path_for(resource)
    #     adminpage_path(resource)
    # end

    #ログアウト後の遷移先を設定
    def after_sign_out_path_for(resource)
        root_path
    end

    protected

    #カートを取得または作成するメソッド
    def current_cart
        @current_cart = Cart.find_by(id: session[:cart_id])
        @current_cart = Cart.create unless @current_cart
        session[:cart_id] = @current_cart.id
        @current_cart
    end

    #サインアップ時にnameとadminn_flgを許可
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :admin_flg])
    end

end
