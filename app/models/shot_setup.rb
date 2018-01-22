class ShotSetup < ApplicationRecord
  has_attached_file :example, styles: { large: "1200x800>",medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :example, content_type: /\Aimage\/.*\z/
  has_attached_file :clock, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :clock, content_type: /\Aimage\/.*\z/
end
