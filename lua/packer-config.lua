local m = {}
function m.config(use)
    require 'plugins.git'(use)
end
return m
