class SignaturesController < ApplicationController
  def index
    @nda = NonDisclosureAgreement.last
    @signature = @nda.signatures.build
  end
end
