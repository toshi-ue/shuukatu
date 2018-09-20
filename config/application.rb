require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Shuukatu
  class Application < Rails::Application

    # rails4ではエラー扱いになる(5ではOK)
    # config.action_view.automatically_disable_submit_tag = false

    config.generators do |g|
      g.test_framework :rspec,
      fixtures: true,
      view_specs: false,
      helper_specs: true,
      routing_specs: false,
      controller_specs: true
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Tokyo'

    config.active_record.default_timezone = :local

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # 日本語
    config.i18n.default_locale = :ja

    # locales以下のファイルの読み込み
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    # config.active_job.queue_adapter = :sidekiq
  end
end
