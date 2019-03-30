class ContentResource < JSONAPI::Resource
  attributes :content
  has_one :tag
  has_one :url, through: :tag

end

