local m = {}
function m.config(use)
    require 'plugins.git'(use)
    require 'plugins.colors'(use)
end
return m
