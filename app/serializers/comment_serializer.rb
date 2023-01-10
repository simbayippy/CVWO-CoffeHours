class CommentSerializer
  include FastJsonapi::ObjectSerializer
  attributes :body, :upvotes, :commentor, :post_id, :user_id
end
