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
	IN	MX	10	mail.wt7.ephec-ti.be.

; A RECORDS 
ns1	IN	A	151.80.119.151
ns2	IN	A	151.80.119.138
ns3	IN	A	151.80.119.127

; server web
web		IN	A	151.80.119.151
service		IN	A	151.80.119.127
www		IN	CNAME	web	
b2b		IN	CNAME	web
intranet	IN	CNAME	web
postfixadmin	IN	CNAME	service
webmail		IN	CNAME	service

;; server mail
mail	IN	A	151.80.119.127
mail._domainkey IN      TXT     ( "v=DKIM1; k=rsa; "
          "p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6dexuc+fPxCO+hxOOsnVZamzXPCi4JmiJH65iIC2quRPub9vOxYZBmo62hao5yho0xVrBkMAXssX16f66QGpglaCJVAtqUaW0jjyjc5KtE8D43KkEJ1MtSv5r7te1Nf+locNq1Y/taSxRCAsL6yfZU+cDsjEeZCSiivYcYWJ6nA+YyD17iU0Y4/+E/bJA8ZWtno1kr3jWT3FAl"
          "LPaO1c2a7rZCSyR2aEFRpFOJL3hF8iXodMA5MWAjqCGMemoFRQPy+89bT8dLqmX+rnuypoRjp+VWcMiCIPW3E9rhTV/BcZ5UJCAVh6amb9LQgtKLZzg2Bc3VJnAQP9745nECPwKwIDAQAB" )  ; ----- DKIM key mail for wt7.ephec-ti.be

