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
  belongs_to :creator, class_name: 'User'
end
