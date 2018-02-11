class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    render html: 'Hey! Maybe I will like RoR enough to become a Rails developer? :D'
  end
end
