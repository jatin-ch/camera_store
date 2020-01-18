class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :category_id, :description, :price, :make
end
