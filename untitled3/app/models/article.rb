class Article < ApplicationRecord

  def self.search(search)
    where("body LIKE ?", "%#{search}")
  end
end
