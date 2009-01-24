$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'test/unit'
require 'rubygems'
require 'mocha'

RAILS_ROOT = File.dirname(__FILE__)
RAILS_ENV  = ENV['RAILS_ENV'] || 'production'

$asset_packages_yml = YAML.load_file("#{RAILS_ROOT}/asset_packages.yml")
$asset_base_path = "#{RAILS_ROOT}/assets"

require 'action_controller'
require 'action_controller/test_process'
require 'synthesis/asset_package'
require 'synthesis/asset_package_helper'

ActionController::Base.logger = nil
ActionController::Routing::Routes.reload rescue nil
ActionView::Base.send :include, Synthesis::AssetPackageHelper
