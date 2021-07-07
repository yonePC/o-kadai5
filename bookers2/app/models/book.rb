class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }

  def self.looks(searches, words)
    if searches == "perfect_match"
      @book = Book.where("#{words}")
    elsif searches == "forward_match"
      @book = Book.where("name LIKE ?", "%#{words}")
    elsif searches == "backward_match"
      @book = Book.where("name LIKE ?", "#{words}%")
    elsif searches == "partial_match"
      @book = Book.where("name LIKE ?", "%#{words}%")
    end
  end

end
