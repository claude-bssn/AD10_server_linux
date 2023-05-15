 #!/bin/bash 
  sudo apt-get install -y haproxy
  
  # Configurer HAProxy
  sudo cat <<-EOF > /etc/haproxy/haproxy.cfg 
    global
        log /dev/log    local0
        log /dev/log    local1 notice
        chroot /var/lib/haproxy
        stats socket /run/haproxy/admin.sock mode 660 level admin expose-fd listeners
        stats timeout 30s
        user haproxy
        group haproxy
        daemon

    defaults
        log     global
        mode    http
        option  httplog
        option  dontlognull
        timeout connect 5000
        timeout client  50000
        timeout server  50000
        errorfile 400 /etc/haproxy/errors/400.http
        errorfile 403 /etc/haproxy/errors/403.http
        errorfile 408 /etc/haproxy/errors/408.http
        errorfile 500 /etc/haproxy/errors/500.http
        errorfile 502 /etc/haproxy/errors/502.http
        errorfile 503 /etc/haproxy/errors/503.http
        errorfile 504 /etc/haproxy/errors/504.http

    frontend http_front
        bind *:80
        stats uri /haproxy?stats
        default_backend http_back

    backend http_back
        balance roundrobin
        server web1 192.168.20.4:80 check
        server web2 192.168.20.5:80 check
EOF
  
  # Redémarrer HAProxy pour prendre en compte la nouvelle configuration
  sudo systemctl restart haproxy