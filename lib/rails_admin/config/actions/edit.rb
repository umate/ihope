module RailsAdmin
  module Config
    module Actions
      class Edit < RailsAdmin::Config::Actions::Base
        register_instance_option :controller do
          Proc.new do

            default_locale = :ru
            locale = params[:locale] || default_locale



            if request.get? # EDIT

              respond_to do |format|
                format.html { render @action.template_name }
                format.js   { render @action.template_name, :layout => false }
              end

            elsif request.put? # UPDATE
              I18n.locale = locale
              satisfy_strong_params!
              sanitize_params_for!(request.xhr? ? :modal : :update)

              @object.set_attributes(params[@abstract_model.param_key], _attr_accessible_role)
              @authorization_adapter && @authorization_adapter.attributes_for(:update, @abstract_model).each do |name, value|
                @object.send("#{name}=", value)
              end
              changes = @object.changes
              if @object.save
                @auditing_adapter && @auditing_adapter.update_object(@object, @abstract_model, _current_user, changes)
                I18n.locale = default_locale
                respond_to do |format|
                  format.html { redirect_to_on_success }
                  format.js { render :json => { :id => @object.id.to_s, :label => @model_config.with(:object => @object).object_label } }
                end
              else
                handle_save_error :edit
              end

            end

          end
        end

        register_instance_option :link_icon do
          'icon-pencil'
        end
      end
    end
  end
end
