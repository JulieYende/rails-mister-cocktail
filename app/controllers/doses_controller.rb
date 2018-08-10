class DosesController < ApplicationController
  def show
    @dose = Dose.find(params[:id])
  end
  def new
    @dose  = Dose.new
  end
end
