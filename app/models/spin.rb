class Spin < ApplicationRecord
  belongs_to :user
  has_many :shots, :dependent => :delete_all
  has_attached_file :shot1, styles: { large: "1200x800>", medium: "400x400>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :shot1, content_type: /\Aimage\/.*\z/
end
