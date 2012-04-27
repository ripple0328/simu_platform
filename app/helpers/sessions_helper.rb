module SessionsHelper

  def deny_access
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end


  private

 end
