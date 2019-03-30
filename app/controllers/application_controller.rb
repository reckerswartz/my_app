# frozen_string_literal: true

class ApplicationController < ActionController::API
  include JSONAPI::ActsAsResourceController
  include ActionController::RequestForgeryProtection
  include ActionController::Flash


  protect_from_forgery unless: -> { request.format.json? }
end
