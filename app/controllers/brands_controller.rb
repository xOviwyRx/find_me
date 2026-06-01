class BrandsController < BaseController
  def update
    saved = @brand.update(brand_params)
    render :update, status: saved ? :ok : :unprocessable_entity
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end
