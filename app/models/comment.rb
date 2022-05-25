class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :text, type: String
  embedded_in :article, class_name: "Article", inverse_of: :comments
end
