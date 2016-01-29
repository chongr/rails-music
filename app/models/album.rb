class Album < ActiveRecord::Base
  ALBUM_TYPES = ["Live", "Studio"]

  validates :name, :album_type, :band, presence: true
  validates :album_type, inclusion: {in: ALBUM_TYPES}

  belongs_to :band

  has_many :tracks,
    dependent: :destroy

  def self.album_types
    ALBUM_TYPES
  end
end
