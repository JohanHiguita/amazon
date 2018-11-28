class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence:true

  # scope :published, -> {where(published: true)}
  scope :popular, -> {where("views > ?", 10)} #suponiendo sí se tiene un atributo "views"
end
