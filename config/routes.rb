PutsReq::Application.routes.draw do
  devise_for :users

  root to: 'home#index'

  devise_scope :user do
    authenticated :user do
      post 'buckets' => 'buckets#create', as: :buckets
      get ':token/requests_count' => 'buckets#requests_count'
      get ':token/inspect' => 'buckets#show', as: :bucket
      get ':token/last' => 'buckets#last', as: :bucket_last
      get ':token/requests/:id' => 'requests#show', as: :request
      get ':token/last_response' => 'buckets#last_response', as: :bucket_last_response
      delete ':token/delete' => 'buckets#destroy', as: :bucket_destroy
      delete ':token/clear' => 'buckets#clear', as: :bucket_clear
      put ':token/buckets' => 'buckets#update', as: :update_bucket
      post ':token/fork' => 'buckets#fork', as: :bucket_fork
    end
    #unauthenticated :user do
    #end

    match ':token' => 'buckets#record', via: :all, as: :bucket_record
  end

end
