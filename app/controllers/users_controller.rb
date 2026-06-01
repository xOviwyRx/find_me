class UsersController < BaseController
  def create
    @user = User.new(user_params)
    @user.settings.build(brand: @brand)
    @user.save
    @brand.reload

    render :create, status: @user.persisted? ? :ok : :unprocessable_entity
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
