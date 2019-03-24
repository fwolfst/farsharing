# == Schema Information
#
# Table name: location_features
#
#  id          :integer          not null, primary key
#  location_id :integer
#  feature_id  :integer
#  details     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LocationFeature < ApplicationRecord
  belongs_to :location
  belongs_to :feature
end
