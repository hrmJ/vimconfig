local m = {}
function m.config(use)
    require 'plugins.git'(use)
    require 'plugins.colors'(use)
    require 'plugins.telescope'(use)
end
return m
