class NoticesController < ApplicationController
  before_action :logged_in_user

  def index
    @notices = Notice.paginate(page: params[:page], :per_page => 6)
  end


end
