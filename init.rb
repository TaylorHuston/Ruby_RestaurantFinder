#Ruby convention usually says have the init.rb as the entry point of a program

#### Food Finder ####

#App root will allot you to include other files easilly
APP_ROOT = FIle.dirname(__FILE__)

#Fil.join is a shorthand to make a proper filepath
require File.join(APP_ROOT, 'lib', 'guide')


