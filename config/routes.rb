Rails.application.routes.draw do



  root "main#index", as: :root
  post '/', to: 'main#create', as: :appointment_create


  # Генерация ключа для админки
  post 'generate-key', to: "button#trigger_button", as: :key

  # Блог
  resources :blogs

  # Админка
  get 'admin', to: 'admin#index', as: :admin
  post 'admin/generate_key', to: 'admin#generate_key', as: :admin_generate_key
  post 'admin', to: 'admin#create', as: :create_admin
  post 'admin/delete', to: 'admin#destroy', as: :destroy_admin_keys
  post 'admin/destroy_admin', to: 'admin#destroy_admin', as: :destroy_admin_session
  post 'admin/delete_appointment/:id', to: 'main#destroy', as: :appointment_destroy


  # Создание услуг
  resources :website_services, only: [:create, :destroy]


  # Валидация админа
  get '/validate_admin', to: 'validate_admin#index', as: :validate_admin
  post '/validate_admin', to: 'validate_admin#create', as: :validate_admin_proverk
end

