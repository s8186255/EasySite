#coding utf-8
class HomeController < ApplicationController
  layout "front/layout"
  #include ReferralExt
  #after_action ->{ inc_referral_clicks params[:refcode]}

  def index
    @message = "welcome you"
  end
  def show

  end
end
