# Use this hook to configure ckeditor
if Object.const_defined?("Ckeditor")
  Ckeditor.setup do |config|
    # ==> ORM configuration
    # available as additional gems.
    require "ckeditor/orm/active_record"

    # Allowed image file types for upload.
    # Set to nil or [] (empty array) for all file types
    config.image_file_types = ["jpg", "jpeg", "png", "gif"]

    # Allowed attachment file types for upload.
    # Set to nil or [] (empty array) for all file types
    config.attachment_file_types = []

    # Setup authorization to be run as a before filter
    # config.authorize_with :cancan
  end
end
