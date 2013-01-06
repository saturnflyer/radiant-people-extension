require 'ostruct'
class PeopleExtension < Radiant::Extension
  version     RadiantPeopleExtension::VERSION
  description RadiantPeopleExtension::DESCRIPTION
  url         RadiantPeopleExtension::URL

  def activate
    Radiant::AdminUI.class_eval do
      attr_accessor :people
    end
    admin.people = load_default_people_regions
    tab "Contacts" do
      add_item 'People', "/admin/people"
    end
  end
  
  def deactivate
  end
  
  def load_default_people_regions
    OpenStruct.new.tap do |people|
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
