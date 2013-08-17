
require Rails.root.join('lib', 'rails_admin/config/actions/publish.rb')

RailsAdmin.config do |config|

  CMS_LABEL = 'CMS'

  ################  Global configuration  ################
  #config.main_app_name = ['Application name', 'Панель управления']
  config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, 'Панель управления'] }

  config.compact_show_view = false
  config.current_user_method { current_user }
  config.default_items_per_page = 20

  config.excluded_models = [ Ckeditor::Asset, Ckeditor::AttachmentFile, Ckeditor::Picture ]

  ############### Actions #################
  config.actions do
    dashboard

    index
    new

    export
    bulk_delete
    show

    edit

    delete

    publish do
      visible do
        (obj = bindings[:object]) && obj.respond_to?(:published) && !bindings[:object].published
      end
    end
  end


  ################ Models #################
  config.model User do
    navigation_icon 'icon-user'
    navigation_label CMS_LABEL

    field :id
    field :email
    field :password
    field :sign_in_count
    field :last_sign_in_at
  end

  config.model Page do
    navigation_icon 'icon-file'

    field :title
    field :slug do
      help 'Короткий код. Может содержать только буквы латинского алфавита, цифры, знаки _ и -'
    end

    edit do
      field :content do
        ckeditor true
      end
    end

    show do
      field :content
    end
  end

  config.model Setting do
    navigation_icon 'icon-tags'

    field :name do
      help 'Разрешены только цифры латинского алфавита и подчеркивания'
    end

    field :content do
      ckeditor true
    end
    field :internal
  end

  config.model NewsArticle do
    navigation_icon 'icon-bullhorn'

    field :title
    field :short_description
    field :created_at

    edit do
      field :content do
        ckeditor true
      end

      field :image, :carrierwave
    end


    show do
      field :content
      field :image, :carrierwave
    end
  end

end
