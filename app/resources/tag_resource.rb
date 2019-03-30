class TagResource < JSONAPI::Resource
  attributes :tag
  has_many :content
  has_one :url
end