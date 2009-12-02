require 'ostruct'
class PeopleExtension < Radiant::Extension
  version "1.0"
  description "Manage people."
  url "http://saturnflyer.com/"
  
  extension_config do |config|
    config.gem 'will_paginate'
    config.gem 'searchlogic'
  end
  
  define_routes do |map|
    map.merge_admin_people '/admin/people/merge.:format', :controller => 'admin/people', :action => 'merge', :conditions => {:method => :post}
    map.namespace :admin do |admin|
      admin.resources :people, :member => { :remove => :get }
    end
  end
  
  def activate
    Radiant::AdminUI.class_eval do
      attr_accessor :people
    end
    admin.people = load_default_people_regions
    admin.tabs.add "People", "/admin/people", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
  end
  
  def load_default_people_regions
    returning OpenStruct.new do |people|
      people.index = Radiant::AdminUI::RegionSet.new do |index|
        index.top.concat %w{search}
        index.people_head.concat %w{name_column_head gender_column_head}
        index.person.concat %w{name_column gender_column}
      end
      people.new = Radiant::AdminUI::RegionSet.new do |new|
        new.person_info.concat %w{}
        new.buttons.concat %w{}
      end
      people.edit = people.new.clone
    end
  end
  
end
