class NoticesController < ApplicationController
  before_action :logged_in_user
  before_action :admin_or_owner, only: :destroy


  def index
    @notices = Notice.paginate(page: params[:page], :per_page => 6)
    @notice = current_user.notices.new
  end

  def create
    @notices = Notice.paginate(page: params[:page], :per_page => 6)
    @notice = current_user.notices.build(notices_params)
    if @notice.save
      flash[:success] = "Message posted!"
      redirect_to root_url
    else
      render 'index'
    end
  end

  def destroy
    @notice.destroy
    flash.now[:success] = "Micropost deleted"
    redirect_to root_url
  end

  private

  def notices_params
    params.require(:notice).permit(:content, :title)
  end

  def admin_or_owner
    @notice = current_user.notices.find_by(id: params[:id])
    if current_user.admin?
      @notice = Notice.find_by(id: params[:id])
    elsif @notice.nil?
      redirect_to(root_url)
    end
  end

end
