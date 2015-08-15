class Purchase < ActiveRecord::Base
serialize :merchandise_id, Array
belongs_to :user
after_create :count_total_price

  def merchandises
    merch_array = []
    merchandise_id.each do |id|
      merch_array << Merchandise.find(id)
    end
    merch_array
  end

  def count_total_price
    price = 0
    merchandises.each do |merch|
      price += merch.retail_price
    end   
    total_price = price
    save
  end
end
