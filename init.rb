require 'redmine'

Redmine::Plugin.register :chiliproject_timebank do
  name 'Chiliproject Time Bank plugin'
  author 'Patrick Naubert'
  description 'Time Bank for consulting companies.  Think of it as a negative time entry.'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  permission :see_project_timebank, { }, :require => :member
  permission :edit_project_timebank, { }, :require => :member
  menu(:top_menu,
    :timebank,
    {:controller => 'timebank', :action => 'index'},
    :caption => :timebank_title,
    :if => Proc.new {
      User.current.allowed_to?(:see_project_timebank, nil, :global => true) ||
      User.current.admin?
  })
end
