class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :body, :upvotes, :poster, :slug, :tag_id, :user_id

  has_many :comments, dependent: :destroy
end
