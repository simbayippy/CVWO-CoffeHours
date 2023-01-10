class TagSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :slug

  has_many :posts
end
