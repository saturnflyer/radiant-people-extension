module Admin::PeopleHelper
  def render_person(person, locals={})
    details = locals.merge!({:person => person})
    render person, details
  end
end
