class Micropost < ApplicationRecord
  belongs_to :user
  scope :ordered, -> {order created_at: :desc}
  mount_uploader :picture, PictureUploader
  validates :user, presence: true
  validates :content, presence: true, length: {maximum: Settings.validates_micropost_content}
  validate :picture_size

  private

  def picture_size
    if picture.size > Settings.piture_size.megabytes
      errors.add :picture, t(".picture_size_limit")
    end
  end
end
