class MainController < ApplicationController
    def index
        @appointment = Appointment.new

        @website_service = WebsiteService.new
        @website_services = WebsiteService.all
    end

    def create
        @appointment = Appointment.new(validator)
        
        if @appointment.save
            redirect_to root_path, alert: 'Запись успешно создана.'
        else
            return false
        end
    end

    def destroy

        @appointment = Appointment.find(params[:id])
        @appointment.destroy
        redirect_to admin_path, notice: 'Запись успешно удалена.'

    end



    def validator
        params.require(:appointment).permit(:name, :phone, :animal_type, :description)
    end
    

end
