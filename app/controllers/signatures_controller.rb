class SignaturesController < ApplicationController
  def index
    @nda = NonDisclosureAgreement.last
    @signature = @nda.signatures.build
  end

  def create
    @nda = NonDisclosureAgreement.last
    @signature = @nda.signatures.create(signature_params)
    if @signature.save
      redirect_to root_path, notice: "NDA Successfully Submitted!"
    else
      render :index
    end
  end

  private

  def signature_params
    params.require(:signature).permit(:name, :drawn_signature)
  end
end
