module Spree
  module AuthenticationHelpers
    def self.included(receiver)
      receiver.helper_method(
        :spree_current_user,
        :spree_login_path,
        :spree_signup_path,
        :spree_logout_path,
        :spree_forgot_password_path,
        :spree_edit_password_path,
        :spree_admin_login_path,
        :spree_admin_logout_path
      )
    end

    def spree_current_user
      current_spree_user
    end

    def spree_login_path(opts = {})
      spree.new_spree_user_session_path(opts)
    end

    def spree_signup_path(opts = {})
      spree.new_spree_user_registration_path(opts)
    end

    def spree_logout_path(opts = {})
      spree.destroy_spree_user_session_path(opts)
    end

    def spree_forgot_password_path(opts = {})
      spree.new_spree_user_password_path(opts)
    end

    def spree_edit_password_path(opts = {})
      spree.edit_spree_user_password_path(opts)
    end

    def spree_admin_login_path(opts = {})
      spree.new_spree_user_session_path(opts.merge(redirect_to: spree.admin_path))
    end

    def spree_admin_logout_path(opts = {})
      spree.destroy_spree_user_session_path(opts.merge(redirect_to: spree.admin_path))
    end
  end
end

ApplicationController.include Spree::AuthenticationHelpers if defined?(ApplicationController)
