class SignaturesController < ApplicationController
  def index
    @nda = NonDisclosureAgreement.last
  end
end
