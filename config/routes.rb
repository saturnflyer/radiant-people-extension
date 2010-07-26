ActionController::Routing::Routes.draw do |map|
    map.merge_admin_people '/admin/people/merge.:format', :controller => 'admin/people', :action => 'merge', :conditions => {:method => :post}
    map.namespace :admin do |admin|
      admin.resources :people, :member => { :remove => :get }
    end
end