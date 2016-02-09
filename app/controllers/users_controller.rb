class UsersController < APIController

  def index
    @users = User.all
    render json: @users
  end
  
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.new(list_params)

    if @user.save
      render json: @user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: @user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy

    begin
      @user = User.find(params[:id])
      @user.destroy

      render json: {}, status: :no_content

     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end

  end

  private

    def user_params
      params.require(:list).permit(:name, :email)
    end

end