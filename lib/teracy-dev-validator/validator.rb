require 'teracy-dev/logging'

module TeracyDevValidator
  # the base class for specific validators to extend
  class Validator
    def initialize
      @logger = TeracyDev::Logging.logger_for(self.class.name)
    end


    # validators must implement this method to execute actual validation
    # raise TeracyDevValidator::ValidationError if there are invalid values
    # when ValidationError is raised, teracy-dev will be aborted with error messages
    # settings can be common or node settings
    def validate(settings, type:)
      case type
      when 'common'
        validate_common(settings)
      when 'node'
        validate_node(settings)
      end
    end

    protected

    def validate_common(settings)

    end

    def validate_node(settings)

    end
  end
end
