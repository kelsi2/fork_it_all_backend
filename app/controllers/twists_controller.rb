class TwistsController < ApplicationController
  def index
    twists = Twist.order("created_at DESC")
    render json: twists.to_json
  end

  def show
    twist = Twist.find params[:id]
    render json: twist.to_json
  end

  def create
    twist = Twist.create(twist_param)
    render json: twist
  end

  def update
    twist = Twist.find(params[:id])
    twist.update_attributes(twist_param)
    render json: twist
  end

  def destroy
    twist = Twist.find(params[:id])
    twist.destroy
    head :no_content, status: :ok
  end
  
  private
    def twist_param
      params.require(:twist).permit(
        :recipe_id,
        :user_id,
        :tags,
        :slug,
        :is_private,
        :sort_order,
        :content
      );
    end
end