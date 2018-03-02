class NoticesController < ApplicationController
  before_action :logged_in_user


  def index
    @notices = Notice.paginate(page: params[:page], :per_page => 6)
    @notice = current_user.notices.new
  end

  def create
    @notice = current_user.notices.build(notices_params)
    if @notice.save
      flash[:success] = "Message posted!"
      redirect_to root_url
    else
      render 'index'
    end
  end

  def destroy

  end

  private
  def notices_params
    params.require(:notice).permit(:content, :title)
  end



end
