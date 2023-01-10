class Tag < ApplicationRecord
    has_many :posts, dependent: :destroy

    before_create :slugify

    def slugify
        self.slug = name.parameterize
    end
end
