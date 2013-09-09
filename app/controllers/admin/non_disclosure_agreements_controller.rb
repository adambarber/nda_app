class Admin::NonDisclosureAgreementsController < AdminController
  def index
    @ndas = NonDisclosureAgreement.all
  end

  def show
    @nda = NonDisclosureAgreement.find(params[:id])
  end
end
