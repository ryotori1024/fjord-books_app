# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image

  validate :image_content_type

  private

  def image_content_type
    extension = ['image/png', 'image/jpeg', 'image/gif']
    errors.add(:image, 'の拡張子はpng、jpg、jpeg、gifのみを指定してください') unless image.content_type.in?(extension)
  end
end
