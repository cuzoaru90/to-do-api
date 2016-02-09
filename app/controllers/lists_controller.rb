class ListsController < APIController

  def index
    @lists = List.all
    render json: @lists
  end
  
  def show
    @list = List.find(params[:id])
    render json: @list
  end

  def create
    @list = List.new(list_params)

    if @list.save
      render json: @list
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @list = List.find(params[:id])

    if @list.update(list_params)
      render json: @list
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy

    begin
      @list = List.find(params[:id])
      @list.destroy

      render json: {}, status: :no_content

     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end

  end

  private

    def list_params
      params.require(:list).permit(:title)
    end

end