ActionController::Routing::Routes.draw do |map|
  map.connect 'timebank/report.:format', :controller => 'timebank', :action => 'report'
  map.connect 'timebank', :controller => 'timebank', :action => 'index'
end
