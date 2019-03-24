# == Schema Information
#
# Table name: features
#
#  id         :integer          not null, primary key
#  name       :string
#  icon       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Feature < ApplicationRecord
  has_many :location_features
  has_many :locations, through: :location_features

  validates :name, presence: true, uniqueness: true
end
