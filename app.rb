require 'sinatra'
require 'sinatra/flash'
require 'data_mapper'
require 'dm-sqlite-adapter'
require 'erb'
require 'pry'

enable :sessions

require './model'
require './route'
require './helper'
