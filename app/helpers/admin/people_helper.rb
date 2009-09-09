module Admin::PeopleHelper
  def render_person(person)
    @current_person = person
    render 'person', :person => @current_person
  end
end
