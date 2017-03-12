;
; BIND data file for wt7.ephec-ti.be
; 

$TTL  	1h
@	IN	SOA	ns1.wt7.ephec-ti.be. root.wt7.ephec-ti.be.(
			1
			3h
			1h
			1w
			1h )
;
@	IN	NS	ns1.wt7.ephec-ti.be.

wt7.ephec-ti.be.	IN	A	151.80.119.151

ns1		IN	A	151.80.119.151
www		IN	CNAME	wt7.ephec-ti.be.
b2b		IN	CNAME	wt7.ephec-ti.be.
intranet	IN	CNAME	wt7.ephec-ti.be.
