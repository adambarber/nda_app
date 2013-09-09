class Admin::NonDisclosureAgreementsController < AdminController
  def index
    @ndas = NonDisclosureAgreement.all
  end

  def show
    @nda = NonDisclosureAgreement.find(params[:id])
  end

  def edit
    @nda = NonDisclosureAgreement.find(params[:id])
  end

  def update
    @nda = NonDisclosureAgreement.find(params[:id])
    if @nda.update_attributes(nda_params)
      redirect_to admin_non_disclosure_agreement_path(@nda), notice: "Success!"
    else
      render 'edit'
    end
  end

  def new
    @nda = NonDisclosureAgreement.new
  end

  def create
    @nda = NonDisclosureAgreement.create(nda_params)
    if @nda.save
      redirect_to admin_non_disclosure_agreement_path(@nda), notice: "Success!"
    else
      render 'new'
    end
  end

  private

  def nda_params
    params.require(:non_disclosure_agreement).permit(:name, :body)
  end
end
