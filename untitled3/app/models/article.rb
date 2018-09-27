class Article < ApplicationRecord
  validates :article, presence: true
  def self.search(search)
    if search.present?
      where('body LIKE ?', "%#{search}%")
    else
    end
  end
end
