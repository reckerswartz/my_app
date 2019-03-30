class TagResource < JSONAPI::Resource
  attributes :tag
  has_many :contents
  has_one :url
end