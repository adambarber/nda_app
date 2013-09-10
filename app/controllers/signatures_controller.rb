class SignaturesController < ApplicationController
  def index
    @nda = NonDisclosureAgreement.last
    @signature = @nda.signatures.build
  end

  def create
    @nda = NonDisclosureAgreement.last
    @signature = @nda.signatures.create(signature_params)
    if @signature.save
      redirect_to finished_path
    else
      redirect_to root_path, notice: "Something went wrong. Please try again."
    end
  end

  def thanks

  end

  private

  def signature_params
    params.require(:signature).permit(:name, :drawn_signature)
  end
end
