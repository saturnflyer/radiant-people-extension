class Admin::PeopleController < Admin::ResourceController
  before_filter :load_stylesheets
  before_filter :add_styles
  
  def index
    if params[:person] #search
      @people = Person.search(params[:person]).paginate(:page => params[:page], :per_page => 50)
    else
      @people = Person.all.paginate(:page => params[:page], :per_page => 50)
    end
  end
  
  def merge
    people_ids = params[:merge][:person].collect{|p| p[0].to_i }.to_a
    @people = Person.find_all_by_id(people_ids, :order => :id)
    @person = @people.first
    @person.merge!(@people)
    flash[:notice] = "The people you selected have been merged into #{@person.full_name}."
    redirect_to edit_admin_person_path(@person)
  end
  
  def announce_saved
    flash[:notice] = "#{@person.full_name} saved below."
  end
  
  def load_stylesheets
    # include_stylesheet 'admin/people'
  end
  def add_styles
    @content_for_page_css ||= ''
    @content_for_page_css << %{
.search { background: #eae3c5; border: 1px solid #fff; padding: 10px}
.label_head { float: left; padding: 0; margin: 0 10px 0 0; }
.form-area { overflow: hidden;}
.form-area td { vertical-align: top;}
h2 { color: #b7b092; margin: 1em 0 0; border-bottom: 2px solid #eae3c5; }
.personExtras { clear: both;}
.recordPart { float: left;}
.recordPart label, .recordPart input { display: block; }}
  end
end
