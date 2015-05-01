#Ruby convention usually says have the init.rb as the entry point of a program

#### Food Finder ####

#App root will allot you to include other files easilly
APP_ROOT = File.dirname(__FILE__)

#File.join is a shorthand to make a proper filepath
require File.join(APP_ROOT, 'lib', 'guide')


guide = Guide.new('restaurants.txt')
guide.launch
