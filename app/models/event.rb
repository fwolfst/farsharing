# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  car_id     :integer
#  creator_id :integer
#  kind       :string
#  start_time :datetime
#  end_time   :datetime
#  details    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ApplicationRecord
  belongs_to :car, optional: true
  belongs_to :creator, class_name: 'User', default: -> { Current.user }

  scope :between, ->(time_range) { where("start_time <= ? AND end_time >= ?", time_range.end, time_range.begin) }

  after_initialize :set_default_times

  def set_default_times
    self.start_time ||= DateTime.now
    self.end_time   ||= self.start_time + 1
  end
end
