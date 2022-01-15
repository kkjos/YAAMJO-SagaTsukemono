class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true , format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :message, presence: true
end
