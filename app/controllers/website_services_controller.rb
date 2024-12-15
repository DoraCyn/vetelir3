class WebsiteServicesController < ApplicationController
    before_action :sesion_admin, only: %i[create]
  
    def sesion_admin
      unless session[:admin]
        redirect_to root_path, alert: 'Вам нужно войти в систему как администратор, чтобы создавать блоги.'
      end
    end
  
    def create
      @website_service = WebsiteService.new(validator)
      if @website_service.save
        redirect_to root_path, notice: 'Запись успешно создана.'
      else
        redirect_to root_path, alert: 'Произошла ошибка при создании записи.'
      end
    end
  
    def destroy
      @website_service = WebsiteService.find(params[:id])
      @website_service.destroy
      redirect_to root_path, notice: 'Услуга успешно удалена.'
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: 'Услуга не найдена.'
    end
  
    private
  
    def validator
      params.require(:website_service).permit(:header, :img, :types_of_services_id)
    end
  end