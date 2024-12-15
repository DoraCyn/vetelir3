class AdminController < ApplicationController


  before_action :sesion_admin, only: %i[index]
  def sesion_admin
    unless session[:admin]
      redirect_to validate_admin_path
    end
  end


  def index
    @appointments = Appointment.all
  end

  def destroy_admin
    session[:admin] = false
    redirect_to root_path
  end

  def generate_key
    key = generate_random_key
    @admin = Admin.new(key: key)

    if @admin.save
      flash[:notice] = "Ключ успешно сгенерирован и сохранен: #{key}"
    else
      flash[:alert] = "Ошибка при сохранении ключа"
    end

    redirect_to admin_path
  end


  def destroy
    Admin.destroy_all
    flash[:notice] = 'все ключи удалены'
    
  end

  def create
    @admin = Admin.new(validator)
        
    if @admin.save 

      redirect_to root_path, notice: 'Запись успешно создана.'
    else
      flash[:alert] = "Ошибка при создании записи"
      redirect_to new_admin_path

    end
  end

  private

  def generate_random_key
    SecureRandom.hex(8)
  end



  def validator
    params.require(:admin).permit(:header, :types_of_services_id)

  end
end