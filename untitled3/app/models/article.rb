class Article < ApplicationRecord

  def self.search(search)
    if search.present?
      where('body LIKE ?', "%#{search}%")
    else
      puts('error')
      all
    end
  end
end
