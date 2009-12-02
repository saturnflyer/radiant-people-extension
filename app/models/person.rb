class Person < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  default_scope :order => 'last_name, first_name, middle_name DESC'
  
  def full_name(*options)
    options = options.extract_options!
    if options[:last_name_first]
      "#{last_name}, #{first_name} #{middle_name}".squeeze(' ').strip
    else  
      "#{first_name} #{middle_name} #{last_name}".squeeze(' ').strip
    end
  end
end
