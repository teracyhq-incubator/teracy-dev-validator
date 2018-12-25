require 'teracy-dev/logging'
require 'teracy-dev/util'

require_relative './validation_error'


module TeracyDevValidator
  class Manager

    def initialize
      @logger = TeracyDev::Logging.logger_for(self.class.name)
      @items = []
    end

    @@instance = Manager.new

    def self.instance
      return @@instance
    end

    def register(validator, weight)
      if !validator.respond_to?(:validate)
        @logger.warn("validator #{validator} must implement validate method, ignored")
        return
      end

      unless weight.is_a? Integer and (0..9).include?(weight)
        @logger.warn("#{validator}'s weight (#{weight}) must be an integer and have value in range (0..9), otherwise it will be set to default (5)")
        weight = 5
      end

      @items << { validator: validator, id: @items.length, weight: weight }
      @logger.debug("validator: #{validator} registered")
    end

    def validate(settings, type:)
      @logger.debug("validate #{type}: #{settings}")

      TeracyDev::Util.multi_sort(@items, weight: :desc, id: :asc).each do |item|
        configurator = item[:validator]
        begin
          validator.validate(settings, type: type)
        rescue TeracyDevValidator::ValidationError => e
          @logger.error(e)
          abort
        end
      end
    end
  private_class_method :new
  end
end
