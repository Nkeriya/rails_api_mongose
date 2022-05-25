class Article
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user #, class_name: "User", foreign_key: "key_id"  (most of them are valid)

  field :title, type: String
  field :description, type: String

  validates :title, presence: true

  embeds_many :comments, class_name: "Comment", inverse_of: :article
  # use @article.commets.create(_attributes) to create object
  # and cant be created without parent document i.e, article
end

# article = Article.where('comments.text'=> 'comment3 for article 1')
# Article.collection.aggregate(an).to_a
