# frozen_string_literal: true

class ApplicationController < ActionController::API
  include JSONAPI::ActsAsResourceController

  protect_from_forgery unless: -> { request.format.json? }
end
