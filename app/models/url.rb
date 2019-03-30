# frozen_string_literal: true

class Url < ApplicationRecord
  require 'openssl'
  require 'nokogiri'
  require 'open-uri'

  has_many :tags
  has_many :contents, through: :tags
  validate :url_check
  validates_uniqueness_of :url

  def url_check
    uri = URI.parse(url)
    return if url.present? && uri.is_a?(URI::HTTP) && !uri.host.nil?

    errors.add(:url, 'is not a valid HTTP URL')
  end

  before_save :find_all_tags_and_links

  private

  def find_all_tags_and_links
    doc = Nokogiri::HTML(open(url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
    h1_tags = doc.css('h1').map(&:text)
    h2_tags = doc.css('h2').map(&:text)
    h3_tags = doc.css('h3').map(&:text)
    h4_tags = doc.css('h4').map(&:text)
    link_tags = doc.css('a').map { |element| element['href'] }.compact
    if h1_tags.present?
      tags = self.tags.build(tag: 'h1')
      h1_tags.each do |text|
        tags.contents.build(content: text)
      end
    end
    if h2_tags.present?
      tags = self.tags.build(tag: 'h2')
      h2_tags.each do |text|
        tags.contents.build(content: text)
      end
    end
    if h3_tags.present?
      tags = self.tags.build(tag: 'h3')
      h3_tags.each do |text|
        tags.contents.build(content: text)
      end
    end
    if h4_tags.present?
      tags = self.tags.build(tag: 'h4')
      h4_tags.each do |text|
        tags.contents.build(content: text)
      end
    end

    if link_tags.present?
      tags = self.tags.build(tag: 'a')
      link_tags.each do |text|
        tags.contents.build(content: text)
      end
    end
  end
end
