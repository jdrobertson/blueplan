class Event < ApplicationRecord
  validates :name, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validate :end_time_after_start_time

  has_many :scheduled_songs
  has_many :songs, through: :scheduled_songs

  has_many :event_roles
  has_many :roles, through: :event_roles
  has_many :users, through: :roles

  def all_day?
    starts_at.to_i == starts_at.beginning_of_day.to_i && ends_at.to_i == ends_at.end_of_day.to_i
  end
  
  private

  def end_time_after_start_time
    if starts_at && ends_at && starts_at > ends_at
      errors.add(:start_date, "End time cannot be before or equal to start time")
    end
  end
end
