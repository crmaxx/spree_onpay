require 'spree_core'

module SpreeOnpay
  class Engine < Rails::Engine

    config.autoload_paths += %W(#{config.root}/lib)

    # def self.activate
    #   Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
    #     Rails.env.production? ? require(c) : load(c)
    #   end
    #    Spree::Gateway::Onpay.register
    # end
    initializer "spree.gateway.payment_methods", :after => "spree.register.payment_methods" do |app|
      app.config.spree.payment_methods << Spree::Gateway::Onpay
    end

    #config.to_prepare &method(:activate).to_proc
  end
end
