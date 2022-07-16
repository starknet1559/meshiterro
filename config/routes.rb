Rails.application.routes.draw do
  resources :users,only:[:show, :edit, :update]
  get 'users/edit'
  root'homes#top'
  devise_for :users
  resources :post_images,only:[:new, :create, :index, :show, :destroy] do
   resource :favorites,only:[:create, :destroy]  
  #ここでのresourceは単数系なことに注意、1人のユーザーは1つの投稿に対して1回しかいいねできない」という仕様であるため、destroyをする際にもユーザーidと投稿(post_image)idが分かれば、どのいいねを削除すればいいのかが特定できます。 そのため、いいねのidはURLに含める必要がない(params[:id]を使わなくても良い)ため、resourcesではなくresourceを使ってURLに/:idを含めない形にしています。
   resources :post_comments,only:[:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/homes/about'=>'homes#top',as: 'about'
 
end
