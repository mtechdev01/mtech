Rails.application.routes.draw do

  resources :newsletters
  post 'newsletters/new', to: 'newsletters#new', as: 'sub_newsletter'
  get '/se-desinscrire', to: 'pages#unsubscribe', as: 'unsubscribe'
  post 'newsletters/unsubscribe', to: 'newsletters#unsubscribe', as: 'unsubscribe_newsletter'
  root to: "pages#home"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'registrations' }

  get '/mentions-legales', to: 'pages#legals', as: 'legals'
  get '/a-propos', to: 'pages#about', as: 'about'
  get '/callback', to: 'pages#callback', as: 'fbcallback'
  resources :articles do
    resources :comments
  end

  get '/message', to: 'pages#message', as: 'message'
  resources :conversations do
    resources :messages
  end

  resources :projects do
    resources :comments
  end

  resources :interactions
  resources :likes
  post '/projects/new_support', to: 'projects#new_support'
  post '/projects/new_participation', to: 'projects#new_participation'
  get '/project/:id/participations', to: 'projects#participations', as: 'project_participations'

  resources :surveys, controller: 'surveys'
  post '/reponse', to: 'surveys#reponse', as: 'surveyReponse'
  get '/stats/:id', to: 'surveys#stats', as: 'surveyStats'
  #namespace :blog do
  #  get '/', to: 'articles#index', as: "Index"
  #  get '/:slug', to: 'articles#show', as: "Show"
  #  post '/comment', to: 'articles#comment', as: 'Comment'
  #  post '/like', to: 'articles#like', as: 'Like'
  #end

  #namespace :projects do
  #  get '/', to: 'projects#index', as: "Index"
  #  get '/:slug', to: 'projects#show', as: "Show"
  #  post '/comment', to: 'projects#comment', as: 'Comment'
  #  post '/like', to: 'projects#like', as: 'Like'
  #end

  #namespace :surveys do
  #  get '/', to: 'surveys#index', as: "Index"
  #  get '/:id', to: 'surveys#show', as: "Show"
  #end

  namespace :admin do
    get '/userexport', to: 'users#userexport', as: 'userexport'
    get '/articleexport', to: 'articles#articleexport', as: 'articleexport'
    get '/projectexport', to: 'projects#projectexport', as: 'projectexport'
    get '/nwsletterexport', to: 'newsletters#nwsletterexport', as: 'nwsletterexport'
    get '/commentexport', to: 'comments#commentexport', as: 'commentexport'
    get '/svexport', to: 'surveys#svexport', as: 'svexport'
    get '/svfldexport', to: 'surveys#svfldexport', as: 'svfldexport'
    get '/svrpexport', to: 'surveys#svrpexport', as: 'svrpexport'
    get '/', to: 'pages#dashboard', as: 'dashboard'
    post '/redirecttoFacebook/:id', to: 'articles#redirecttofacebook', as: 'redirectToFacebook'
    get '/publishtoFacebook/:id', to: 'articles#publishtofacebook', as: 'PublishtoFacebook'
    post '/articles/publish', to: 'articles#publish', as:'articlepublish'
    get '/documentation', to: 'pages#documentation', as: 'documentation'
    get '/notifications', to: 'pages#notifications'
    get '/mark-as-read', to: 'pages#mark_as_read'
    resources :articles do
      resources :comments, only: :create
    end

    post '/projects/publish', to: 'projects#publish', as:'projectpublish'
    post '/projects/labelize', to: 'projects#labelize', as: 'projectlabelize'
    resources :projects, controller: 'projects' do
      resources :comments, only: :create
    end

    resources :surveys, controller: 'surveys'
    get '/ajout/question/:id', to: 'surveys#addquestion', as: 'AddQuestion'
    post '/ajout/question/:id', to: 'surveys#addquestion', as: 'AddQuestionPost'
    get '/editer/question/:id', to: 'surveys#editquestion', as: 'EditQuestion'
    post '/editer/question/:id', to: 'surveys#updatequestion', as: 'EditQuestionPost'
    post '/suppression/question/:id', to: 'surveys#deletequestion', as: 'DeleteQuestion'

    resources :categories, controller: 'categories'
    resources :users, controller: 'users'
    resources :comments, controller: 'comments'
    resources :newsletters, controller: 'newsletters'
    post '/comments/validate', to: 'comments#validate', as:'validatecomment'
    post '/users/ban', to: 'users#ban', as:'userban'
    post '/users/cancomment', to: 'users#cancomment', as:'usercancomment'

  end

  namespace :users do
    get '/mon-compte', to: 'account#account', as: 'Account'
    get '/mon-compte/infos', to: 'account#infos', as: 'Infos'
    get '/mon-compte/editer', to: 'account#edit', as: 'Edit'
    patch '/mon-compte/editer', to: 'account#update', as: "Update"
    get '/mon-compte/projets', to: 'account#projects', as: 'Projects'
    get '/mon-compte/commentaires', to: 'account#comments', as: 'Comments'
    get '/mon-compte/sondages', to: 'account#sondages', as: 'Surveys'
    get '/mon-compte/notifications', to: 'account#notifications', as: 'Notifs'
    get '/mon-compte/mark-as-read', to: 'account#mark_as_read', as: 'Readed'
    get '/mon-compte/likes', to: 'account#likes', as: 'Likes'

    resources :projects, controller: 'projects'
  end



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
