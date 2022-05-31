class MocoAccountsController < ApplicationController
  before_action :set_moco_account, only: %i[show edit update destroy]

  def index
    @moco_accounts = current_organization.moco_accounts.ordered_by_name
  end

  def new
    @moco_account = current_organization.moco_accounts.new
  end

  def create
    @moco_account = current_organization.moco_accounts.new(moco_account_params)

    if @moco_account.save
      redirect_to @moco_account
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @moco_account.update(moco_account_params)
      redirect_to @moco_account
    else
      render :edit
    end
  end

  def destroy
    @moco_account.destroy
    redirect_to @moco_account
  end

  private

  def moco_account_params
    params.require(:moco_account).permit(:name, :domain)
  end

  def current_organization
    Organization.first # TODO: You know...
  end

  def set_moco_account
    @moco_account = current_organization.moco_accounts.find_by!(ocomoco_id: params[:ocomoco_id])
  end
end
