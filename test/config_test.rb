# frozen_string_literal: true

class MyCustomInheritedResourcesController < ActionController::Base
end

class InheritedResourcesDefaultConfigurationTest < ActiveSupport::TestCase
  def test_parent_controller_default
    assert_equal ApplicationController, InheritedResources.parent_controller.constantize
  end
end

class InheritedResourcesCustomizedConfigurationTest < ActiveSupport::TestCase
  def setup
    InheritedResources.setup do |config|
      config.parent_controller = 'MyCustomInheritedResourcesController'
    end
  end

  def teardown
    InheritedResources.setup do |config|
      config.parent_controller = '::ApplicationController'
    end
  end

  def test_parent_controller_customized
    assert_equal MyCustomInheritedResourcesController, InheritedResources.parent_controller.constantize
  end
end
