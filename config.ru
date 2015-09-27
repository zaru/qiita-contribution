require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)
require File.expand_path(File.join('..','app'), __FILE__)
run WebApp