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
  has_one_attached :image
  has_many :events

  validates :name, uniqueness: true
  validates :license_plate, uniqueness: true
  validates :num_seats, numericality: { greater_than: 0 }

  validate :name_or_brandmake_presence
  validate :image_is_image
  validate :image_is_not_huge

  private

  def name_or_brandmake_presence
    if name.blank? && (manufacture.blank? || make.blank?)
      errors[:base] << :name_or_make
      errors[:name] << ""
      errors[:manufacture] << ""
      errors[:make] << ""
    end
  end

  def image_is_image
    if image.attached? && !image.content_type.in?(%w{image/jpeg image/png image/gif})
      image.purge
      errors.add :image, :must_be_jpeg_png_or_gif
    end
  end

  def image_is_not_huge
    if image.attached? && image.blob.byte_size > 10240000
      image.purge
      errors.add :image, :must_be_smaller_than_10mb
    end
  end
end
