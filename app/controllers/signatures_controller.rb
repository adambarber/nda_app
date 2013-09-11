class SignaturesController < ApplicationController
  def index
    @nda = NonDisclosureAgreement.last
    @signature = @nda.signatures.build
  end

  def create
    @nda = NonDisclosureAgreement.last
    @signature = @nda.signatures.create(signature_params)
    @signature.ip_address = request.remote_ip
    if @signature.save
      redirect_to finished_path
    else
      redirect_to root_path, notice: "Something went wrong. Please try again."
    end
  end

  def thanks
    Thread.new do
      sleep 10
      puts "\n\n IT WORKS \n\n"
    end
  end

  private

  def signature_params
    params.require(:signature).permit(:name, :drawn_signature, :device_type, :device_browser)
  end
end
