class NoticesController < ApplicationController
  before_action :logged_in_user

  def index
    @notices = Notice.paginate(page: params[:page], :per_page => 6)
  end

  def create
    @notice = current_user.notices.build(notice_params)
    if @notice.save
      flash[:success] = "Message posted!"
    end
    redirect_to root_url
  end

  def destroy
  end

  private

  def notice_params
    params.require(:notice).permit(:content)
  end


end
