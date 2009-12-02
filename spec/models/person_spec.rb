require File.dirname(__FILE__) + '/../spec_helper'

describe Person do
  before(:each) do
    @person = Person.new(:first_name => 'Jim', :last_name => 'Gay', :middle_name => 'M')
  end

  describe "full_name" do
    it "should return the concatenated first, middle, and last names" do
      @person.full_name.should == 'Jim M Gay'
    end
    it "should return the concatenated names stripped of extra whitespace" do
      @person.first_name = '  Jim'
      @person.last_name = 'Gay   '
      @person.middle_name = ''
      @person.full_name.should == 'Jim Gay'
    end
    context 'with :last_name_first' do
      it "should return the concatenated last, first, and middle names" do
        @person.full_name(:last_name_first => true).should == 'Gay, Jim M'
      end
    end
  end
end
