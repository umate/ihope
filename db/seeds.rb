require 'faker'
require 'factory_girl'

FactoryGirl.definition_file_paths = %w(factories)
FactoryGirl.find_definitions

30.times { FactoryGirl.create(:user) }
30.times { FactoryGirl.create(:page) }
30.times { FactoryGirl.create(:news_article) }
