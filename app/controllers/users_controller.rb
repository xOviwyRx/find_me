class UsersController < BaseController
  def create
    result = Users::Create.result(brand: @brand, attributes: user_params)
    @user = result.user
    @brand.reload

    render :create, status: result.success? ? :ok : :unprocessable_entity
  end

  def destroy
    @user = @brand.users.find(params[:id])
    @user.destroy
    @brand.reload
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
