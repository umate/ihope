require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminPublish
end

module RailsAdmin
  module Config
    module Actions
      class Publish < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :member do
          true
        end

        register_instance_option :bulkable? do
          false
        end

        register_instance_option :http_methods do
          [:get, :put]
        end

        register_instance_option :link_icon do
          'icon-check'
        end

        register_instance_option :controller do
          Proc.new do
            @object.update_attribute(:published, true)
            flash[:success] = I18n.t('admin.flash.successful', name: @model_config.label, action: 'успешно опубликован')

            redirect_to back_or_index
          end
        end
      end
    end
  end
end