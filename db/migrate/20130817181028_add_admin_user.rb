class AddAdminUser < ActiveRecord::Migration
  def up
    User.create(email: 'admin@admin.com', password: 'admin1234', role: :admin)
  end
end
