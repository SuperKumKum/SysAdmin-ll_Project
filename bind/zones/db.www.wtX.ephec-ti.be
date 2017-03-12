# BIND data file for local loopback interface
$TTL	604800

wt7.ephec-ti.be	IN	SOA	ns.wt7.ephec-ti.be. admin.wt7.ephec-ti.be. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
wt7.ephec-ti.be.	IN	NS	ns.wt7.ephec-ti.be.
ns.wt7.ephec-ti.be.	IN	A	151.80.119.151
www.wt7.ephec-ti.be.	IN	A	151.80.119.151
b2b.wt7.ephec-ti.be.	IN	A	151.80.119.151
intranet.wt7.ephec.be.	IN	A	151.80.119.151

# same value for the ipv6

ns.wt7.ephec-ti.be.     IN      AAAA       2001:41d0:401:3100:0000:0000:0000:658f
www.wt7.ephec-ti.be.    IN      AAAA       2001:41d0:401:3100:0000:0000:0000:658f
b2b.wt7.ephec-ti.be.    IN      AAAA       2001:41d0:401:3100:0000:0000:0000:658f
intranet.wt7.ephec.be.  IN      AAAA       2001:41d0:401:3100:0000:0000:0000:658f

