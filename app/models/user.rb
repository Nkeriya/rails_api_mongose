class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, type: String
  field :last_name, type: String
  field :birthday, type: Date
  field :phone_number, type: Integer

  has_many :articles, dependent: :destroy

  validates :first_name, presence: true
end
