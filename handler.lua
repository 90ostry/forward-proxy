local plugin = require("kong.plugins.base_plugin"):extend()

function plugin:access(conf)
  local host = ngx.ctx.balancer_address.host 

  ngx.var.upstream_host=host  
  ngx.ctx.balancer_address.host = conf.proxy_host
  ngx.ctx.balancer_address.port = conf.proxy_port 
end

return plugin
