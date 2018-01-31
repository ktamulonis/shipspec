class Shot < ApplicationRecord
  belongs_to :spin
  has_attached_file :picture, styles: { large: "1200x800>", medium: "400x400>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  process_in_background :picture
end
