LindaApp::Application.routes.draw do
  root 'static_pages#home'

  controller :static_pages do
    get "links"
    get "contact"
    get "bio"
  end

  get 'work' => 'galleries#index'

  controller :sessions do
    get    'login'  => :new
    post   'login'  => :create
    delete 'logout' => :destroy
  end
end
