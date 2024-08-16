renew:
	cd ./temp
	make all

all:
	name=telematiq make kget
	name=kaceong make kget
	name=aciom make kget
	name=phusion make kget
	name=ochos make kget
	name=skillsmates make kget
	
	name=tangoeast make kget
	name=tangueros make kget
	name=tcities make kget
	name=tsites make kget


kget:
	make kfetch
	make kpem
	make kdate


kfetch:
	kubectl get secrets/tls-secret-$(name) -n certmanager -o json > ./$(name).json


kpem:
	cat ./$(name).json | jq -r '.data."tls.crt" ' | base64 -d > ./$(name).pem
	cat ./$(name).json | jq -r '.data."tls.key" ' | base64 -d >> ./$(name).pem


kdate:
	cat ./$(name).json | jq -r '.metadata.name' > ./$(name).lease
	cat ./$(name).json | jq -r '.metadata.annotations."cert-manager.io/common-name"' >> ./$(name).lease
	cat ./$(name).pem | openssl x509 -enddate -noout | cut -d "=" -f 2 >> ./$(name).lease



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



