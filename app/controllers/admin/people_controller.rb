class Admin::PeopleController < Admin::ResourceController
  before_filter :load_stylesheets
  
  def announce_saved
    flash[:notice] = "#{@person.full_name} saved below."
  end
  
  def load_stylesheets
    include_stylesheet 'admin/people'
  end
end
