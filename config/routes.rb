Rails.application.routes.draw do

  #get 'picture/index'

  root to: 'picture#index'

 # get '*path', controller: 'application', action: 'render_404'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
