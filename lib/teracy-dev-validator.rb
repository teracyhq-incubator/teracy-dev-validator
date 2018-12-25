require 'teracy-dev'

require_relative 'teracy-dev-validator/config/validator'
require_relative 'teracy-dev-validator/manager'

module TeracyDevValidator

  def self.init
    # weight = 9 so that the validator will be called first as soon as possible
    TeracyDev.register_configurator(Config::Validator.new, weight=9)
  end


  def self.register_validator(validator, weight=5)
    Validator::Manager.instance.register(validator, weight)
  end

end
