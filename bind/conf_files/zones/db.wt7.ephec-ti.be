;
; BIND data file for wt7.ephec-ti.be
;

$TTL 3h
@			IN	SOA	ns.wt7.ephec-ti.be. admin.wt7.ephec-ti.be. (
					1	; serial
					3h	; refresh after 3h
					1h	; retry after 1h
					1w	; expire after 1 week
					1h	; Negative TTL of 1d
); 

@			IN	NS	ns.wt7.ephec-ti.be. 

wt7.ephec-ti.be		IN	A	151.80.119.151
ns			IN	A	151.80.119.151
www			IN	CNAME	wt7.ephec-ti.be
b2b			IN	CNAME	wt7.ephec-ti.be
intranet		IN	CNAME	wt7.ephec-ti.be

; for ipv6
