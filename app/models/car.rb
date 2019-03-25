# == Schema Information
#
# Table name: cars
#
#  id            :integer          not null, primary key
#  name          :string
#  manufacture   :string
#  make          :string
#  license_plate :string
#  num_seats     :integer          default(5)
#  description   :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Car < ApplicationRecord
  validates :name, uniqueness: true
  validates :license_plate, uniqueness: true
  validates :num_seats, numericality: { greater_than: 0 }

  validate :name_or_brandmake_presence

  has_one_attached :image
  has_many :events

  def name_or_brandmake_presence
    if name.blank? && (manufacture.blank? || mark.blank?)
      errors[:base] << I18n.t("Please provide either name or brand and make.")
      errors[:name] << ""
      errors[:manufacture] << ""
      errors[:make] << ""
    end
  end
end
