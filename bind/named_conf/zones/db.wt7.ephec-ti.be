;
; BIND data file for wt7.ephec-ti.be
;

$TTL 3600
wt7.ephec-ti.be.			IN	SOA	ns.wt7.ephec-ti.be. admin.wt7.ephec-ti.be. (
					1	; serial
					3600	; refresh after 1h
					600	; retry after 10m
					86400	; expire after 1d 
					600	; Negative TTL of 10m
); 

wt7.ephec-ti.be.	IN	NS	ns.wt7.ephec-ti.be. 
wt7.ephec-ti.be.	IN	MX	10	mail.wt7.ephec-ti.be.
wt7.ephec-ti.be.	IN	A	151.80.119.151
ns.ephec-ti.be		IN	A	151.80.119.151
mail			IN	A	151.80.119.151
www			IN	CNAME	wt7.ephec-ti.be.
b2b			IN	CNAME	wt7.ephec-ti.be.
intranet		IN	CNAME	wt7.ephec-ti.be.

; for ipv6
wt7.ephec-yi.be		IN	AAAA	2001:41d0:401:3100:0000:0000:0000:658f
ns			IN	AAAA	2001:41d0:401:3100:0000:0000:0000:658f
mail			IN	AAAA	2001:41d0:401:3100:0000:0000:0000:658f
