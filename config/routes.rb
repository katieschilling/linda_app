LindaApp::Application.routes.draw do
  root 'static_pages#home'
  controller :static_pages do
    get "work"
    get "links"
    get "contact"
    get "bio"
  end
end
