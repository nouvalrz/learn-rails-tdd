class Food < ApplicationRecord

  belongs_to :category
  
  validates :name, presence: true, uniqueness: true
  validate :less_than_two_words
  validates :description, presence: true
  validates :price, numericality: true, comparison: { greater_than_or_equal_to: 0.01 }

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end

  def less_than_two_words
    if name.split.size < 2
      errors.add(:name, 'needs to be more than 1 word')
    end if name
  end
end
