class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :group, :model
end
