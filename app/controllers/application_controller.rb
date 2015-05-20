class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_pages, :set_version, :get_user, :check_publisher, only: [:index, :new, :edit, :update, :destroy]

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
    def check_publisher
      if !@currentUser.publisher?
        redirect_to '/'
      end
    end
end
