class BlogsController < ApplicationController
  before_action :sesion_admin, only: %i[create destroy]

  def sesion_admin
    unless session[:admin]
      redirect_to root_path, alert: 'Вам нужно войти в систему как администратор, чтобы создавать блоги.'
    end
  end

  def index
    
    @blogs = Blog.all
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(validator)
    if @blog.save
      redirect_to blogs_path, notice: 'Блог успешно создан.'
    else
      @blogs = Blog.all
      render :index
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: 'Блог успешно удален.'
  rescue ActiveRecord::RecordNotFound
    redirect_to blogs_path, alert: 'Блог не найден.'
  end

  private

  def validator
    params.require(:blog).permit(:header, :video, :description)
  end
end