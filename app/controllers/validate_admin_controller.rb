class ValidateAdminController < ApplicationController

    def index
      @admin_key = Admin.new
    end

    def show
      @admin_key = Admin.new
    end
  
    def create
      all_keys = Admin.pluck(:key) # Получаем все ключи из базы данных
      @admin_key = Admin.new(admin_params)
  
      valid_key_found = false
  
      all_keys.each do |single_key|
        if @admin_key.key == single_key
          valid_key_found = true
          break
        end
      end
  
      if valid_key_found
        session[:admin] = true
        redirect_to root_path, notice: 'Вы успешно вошли как администратор.'
      else
        redirect_to validate_admin_path, alert: 'Неверный ключ.'
        session[:admin] = false
      end
    end
  
    private
  
    def admin_params
      params.require(:admin).permit(:key)
    end
  end