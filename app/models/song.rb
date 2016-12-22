class Song < ApplicationRecord
  validates :title, presence: true,
                    uniqueness: { scope: :artist,
                                  message: "artist cannot have two songs with same name" }
  validates :artist, presence: true
  validates :path, presence: true

  has_many :scheduled_songs
  has_many :events, through: :appointments
end
