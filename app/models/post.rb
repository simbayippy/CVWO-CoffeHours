class Post < ApplicationRecord
  belongs_to :tag
  belongs_to :user

  has_many :comments, dependent: :destroy

  before_create :slugify

  def slugify
      self.slug = title.parameterize
  end
end
