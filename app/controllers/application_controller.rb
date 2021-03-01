class ApplicationController < ActionController::Base
  require 'poke-api-v2'
  before_action :authenticate_trainer!
end
