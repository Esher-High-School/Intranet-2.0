class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_pages, :set_version, :get_user, :publisher_access, only: [:index, :new, :edit, :update, :destroy]

  private
    def set_version
      @version = `git rev-list HEAD --count`
    end
    def set_pages
      @pages = Page.all.order('title ASC')
    end
    def get_user
      @apacheUser = request.env['HTTP_REMOTE_USER'] || request.headers['X-Forwarded-User']
      @currentUser = User.friendly.find(@apacheUser)
      rescue ActiveRecord::RecordNotFound
        @currentUser = User.new
        if @apacheUser != nil
          @currentUser.name = @apacheUser
        else
          @currentUser = User.new
          @currentUser.name = 'unauthenticated'
        end
    end
    def publisher_access
      if !@currentUser.publisher?
        redirect_to '/', notice: 'Access denied - please contact ICT Support if you believe this to be in error'
      end
    end
    def administrator_access
      if !@currentUser.administrator?
        redirect_to '/', notice: 'Access denied - please contact ICT Support if you believe this to be in error'
      end
    end
end
