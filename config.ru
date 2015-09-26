require 'bundler'
require 'logger'
require 'sinatra/reloader'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)
begin
  use Rack::LiveReload, no_swf: true
rescue
  nil
end

require File.expand_path(File.join('..','app'), __FILE__)
run WebApp