# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string
#  details    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord
  has_many :location_features
  has_many :features, through: :location_features

  validates :name, presence: true, uniqueness: true
end
