class Category < ActiveRecord::Base

  has_many :merchandise, through: :merchandise_categories
  has_many :merchandise_categories

def self.create_by_name(name)
    optional_category = find_by(name: name) 
    if optional_category
      optional_category
    else
      new(name: name).tap do |category|
        category.save
      end 
    end 
  end
end
