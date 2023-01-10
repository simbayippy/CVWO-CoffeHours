class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :username, :cryptowallet, :slug

  has_many :posts
  has_many :comments
end