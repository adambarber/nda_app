class AdminController < ApplicationController
  def index
    @signatures = Signature.all
  end
end
