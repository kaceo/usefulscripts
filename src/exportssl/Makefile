
kget:
	kubectl get secrets/tls-secret-$(name) -n certmanager -o json > var/kub/$(name).json
	cat var/kub/$(name).json | jq -r '.data."tls.crt" ' | base64 -d > var/kub/$(name).pem
	cat var/kub/$(name).json | jq -r '.data."tls.key" ' | base64 -d >> var/kub/$(name).pem


kcopy:
	cp var/kub/*.pem var/pems


renew:
	name=telematiq make kget
	name=kaceong make kget
	name=aciom make kget
	name=phusion make kget
	name=phusion make kget
	name=ochos make kget
	name=skillsmates make kget
	name=tangoeast make kget
	name=tangueros make kget
	name=tcities make kget
	name=tsites make kget
	make kcopy


digacme:
	@host -Tt txt _acme-challenge.$(name) localhost
	@echo '----------'
	@host -Tt txt _acme-challenge.$(name) 8.8.8.8
	@echo '----------'
	@host -Tt txt _acme-challenge.$(name) 1.1.1.1
	@echo '----------'
	@host -Tt txt _acme-challenge.$(name) ns2.telematiq.org
	@echo '----------'
	@host -Tt txt _acme-challenge.$(name) ns3.telematiq.org
	@echo '=========='


copyssl:
	cd var/secrets; cp -aL srclive/* live/
	./joiner.py
	cp -aL var/secrets/pems/* var/pems/

