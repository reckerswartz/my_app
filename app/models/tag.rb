# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :url
  has_many :contents
end
