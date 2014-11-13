class ApplicationController < ActionController::Base
  raise "No data in the database! Did you do rake db:seed?" unless Thinker.all.any?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Figure out who is logging in
  def load_active_thinker
    begin 
      @active_thinker = Thinker.find(session[:active_thinker])
    rescue
      session[:active_thinker] = Thinker.last.id
      @active_thinker = Thinker.last
    end
  end
end
