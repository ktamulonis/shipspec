class Spin < ApplicationRecord
  belongs_to :user
  has_many :shots, dependent: :destroy
  has_attached_file :shot1, styles: { medium: "400x400>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :shot1, content_type: /\Aimage\/.*\z/
end
