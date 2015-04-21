class Admin::AdminBaseController< ApplicationController

  #layout 'admin'

  protected
  def authenticate_role
    authenticate_user!
  end
end
