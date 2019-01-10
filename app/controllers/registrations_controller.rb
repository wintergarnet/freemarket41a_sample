# class RegistrationsController < ApplicationController
#    prepend_before_action :require_no_authentication, only: [:sms_confirmation, :address, :credit, :create]
#   before_action :user_new, only:[:sms_confirmation, :address, :credit, :create]

#   def registration
#     @user = User.new
#   end

#   def sms_confirmation
#     # @user.build_address
#     unless verify_recaptcha
#       render action: :registration
#     end
#   end
# end
