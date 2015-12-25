module SolidusAccountRecurring
  class Engine < Rails::Engine
    # require 'solidus/core'
    isolate_namespace Spree
    engine_name 'solidus_account_recurring'

    config.autoload_paths += %W(#{config.root}/lib)

    Spree::Core::Environment.class_eval do
      attr_accessor :recurring_providers
    end

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      ['app', 'lib'].each do |dir|
        Dir.glob(File.join(File.dirname(__FILE__), "../../#{dir}/**/*_decorator*.rb")) do |c|
          Rails.application.config.cache_classes ? require(c) : load(c)
        end
      end
    end

    config.to_prepare &method(:activate).to_proc

    initializer "register recurring providers" do |app|
      app.config.spree.recurring_providers = [Spree::Recurring::StripeRecurring]
    end
  end
end
