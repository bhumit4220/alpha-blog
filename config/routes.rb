Rails.application.routes.draw do
  root 'pages#home'
  get 'about',to: 'pages#about'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]
end


# class Stack
#   def initialize(size)
#     @size = size
#     @store = Array.new(@size)
#     @top = -1
#   end
  
#   def pop
#     if empty?
#       nil
#     else
#       popped = @store[@top]
#       @store[@top] = nil
#       @top = @top.pred
#       popped
#     end
#   end
  
#   def push(element)
#     if full? or element.nil?
#       nil
#     else
#       @top = @top.succ
#       @store[@top] = element
#       self
#     end
#   end
  
#   def size
#     @size
#   end
  
#   def look
#     @store[@top]
#   end
  
#   private
  
#   def full?
#     @top == (@size - 1)
#   end
  
#   def empty?
#     @top == -1
#   end
# end