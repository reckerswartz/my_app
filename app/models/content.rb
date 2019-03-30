# frozen_string_literal: true

class Content < ApplicationRecord
  belongs_to :tag
  has_one :url, through: :tag
end
