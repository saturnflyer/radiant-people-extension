require File.expand_path("../../../spec_helper", __FILE__)

describe Admin::PeopleHelper do
  
  #Delete this example and add some real ones or delete this file
  it "should include the Admin::PeopleHelper" do
    included_modules = self.metaclass.send :included_modules
    included_modules.should include(Admin::PeopleHelper)
  end
  
end
