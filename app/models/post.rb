# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
#  content     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :title, :content, presence: true


  # scope :published, -> {where(published: true)}
  #scope :popular, -> {where("views > ?", 10)} #suponiendo sí se tiene un atributo "views"
end
