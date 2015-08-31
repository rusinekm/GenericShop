class MerchandiseSerializer < ActiveModel::Serializer
  attributes :id, :name, :retail_price, :description, :number_available, :photo,
  :photo_path

  def photo_path
     'http://localhost:3000'+object.photo.url
  end
end
