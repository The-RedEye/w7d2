class Album < ApplicationRecord
  validates :title, :year, :band_id, presence: true, 
  validates :live, inclusion: {in: [true, false]}

  belongs_to :band,
  foreign_id: :band_id

  # has_many :tracks,
  # :dependent :destroy

end
