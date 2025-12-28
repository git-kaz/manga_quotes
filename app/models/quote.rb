class Quote < ApplicationRecord
  belongs_to :user
  validates :content, presence: true

  def self.ransackable_attributes(auth_object = nil)
    %w[content source scene created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []  # アソシエーション検索は使わないので空
  end
end

