class Admin::NonDisclosureAgreementsController < AdminController
  def index
    @ndas = NonDisclosureAgreement.all
  end
end
