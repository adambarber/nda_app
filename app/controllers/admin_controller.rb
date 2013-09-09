class AdminController < ApplicationController
  before_filter :authenticate_user!
  def index
    @signatures = Signature.all
  end

  def settings

  end
end
