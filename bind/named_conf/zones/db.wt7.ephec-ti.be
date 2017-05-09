;
; Modified 09-05-2017
; BIND File 
;

$TTL 1d 
$ORIGIN wt7.ephec-ti.be.
@	1D	IN	SOA	ns1.wt7.ephec-ti.be. admin.wt7.ephec-ti.be (
				1	; serial
				3H	; refresh
				15	; retry 
				1w	; exprire
				3h)	;

; NS RECORDS
	IN	NS	ns1.wt7.ephec-ti.be.
	IN	NS	ns2.wt7.ephec-ti.be.
	IN	NS	ns3.wt7.ephec-ti.be. 
;;	IN	MX	10	mail.wt7.ephec-ti.be.

; A RECORDS 
ns1	IN	A	151.80.119.151
ns2	IN	A	151.80.119.138
ns3	IN	A	151.80.119.127

; server web
web		IN	A	151.80.119.151
www		IN	CNAME	web	
b2b		IN	CNAME	web
intranet	IN	CNAME	web

;; server mail
