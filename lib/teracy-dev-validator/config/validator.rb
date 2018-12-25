require 'teracy-dev/config/configurator'

require_relative '../manager'

module TeracyDevValidator
  module Config
    # see: https://www.vagrantup.com/docs/networking/
    class Validator < TeracyDev::Config::Configurator
      def configure_common(settings, config)
        Validator::Manager.instance.validate(settings, type: 'common')
      end

      def configure_node(settings, config)
        Validator::Manager.instance.validate(settings, type: 'node')
      end
    end
  end
end
