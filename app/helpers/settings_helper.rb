module SettingsHelper
  def setting(name)
    setting = Setting.public.find_by_name(name.to_s)
    setting.content.html_safe if setting
  end
end
