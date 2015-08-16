class Merchandise < ActiveRecord::Base
  has_many :categories, through: :merchandise_categories

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  validates :name, :retail_price, :buy_price, :description, presence: true

  def assign_categories(names_string)
    category_names = names_string.split(',').map(&:strip).uniq
    category_names.each do |name|
      temp_category= Category.create_by_name(name)
      MerchandiseCategory.new(category_id: temp_category.id, merchandise_id: id).save
    end
  end

  def self.category(id)
    ids = MerchandiseCategory.where(category_id: id).map(&:merchandise_id)
      Merchandise.where("id in (?)", ids)
  end

end
