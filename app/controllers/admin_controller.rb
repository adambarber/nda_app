class AdminController < ApplicationController
  before_filter :authenticate_user!
  def index
    @signatures = Signature.all.order("created_at DESC")
  end

  def settings

  end
end
