class CategorySerializer < ActiveModel::Serializer
  attributes :json_key, :id, :name, :category_path
  def category_path
    'http://localhost:3000'+merchandise_index_path(category: object.id)
  end

  def json_key
  'categories'
  end
end
