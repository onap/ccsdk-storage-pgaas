
all:

STAGEDIRS=

build:
	@echo "================ make build ================"
	for i in $(STAGEDIRS); do ( cd $$i/src && $(MAKE) build ) done

clean:
	@echo "================ make clean ================"
	for i in $(STAGEDIRS); do ( cd $$i/src && $(MAKE) clean ) done

stage:
	@echo "================ make stage ================"
	for i in $(STAGEDIRS); do ( cd $$i/src && $(MAKE) stage ) done

upload-javadocs:
	@echo "================ make upload-javadocs ================"
	for i in $(STAGEDIRS); do ( cd $$i/src && $(MAKE) upload-javadocs ) done


debian:
	@echo "================ make debian ================"
	export PATH=$$PATH:$$(pwd)/bin; for i in $(STAGEDIRS); do ( cd $$i/src && $(MAKE) debian ) done


# for ONAP Maven
pgaas:
	@echo "================ make pgaas ================"

generate-sources:
	@echo "================ make generate-sources ================"

compile: build
	@echo "================ make compile ================"

package:
	@echo "================ make package ================"

test:
	@echo "================ make test ================"

install:
	@echo "================ make install ================"

deploy:
	@echo "================ make deploy ================"

olddeploy:
	@echo "================ make deploy ================"
	rm -f $$HOME/.netrc ; \
	REPO=$$MVN_NEXUSPROXY/content/sites/raw/$$MVN_PROJECT_GROUPID ; \
	hostport=$$(echo $$REPO | cut -f3 -d /) ; \
	host=$$(echo $$hostport | cut -f1 -d:) ; set -x ; env ; \
	settings=$${SETTINGS_FILE:-$$HOME/.m2/settings.xml} ; \
	serverid=$${MVN_RAWREPO_SERVERID:-ecomp-raw} ; \
	echo machine $$host login $$(xpath -q -e "//servers/server[id='$$serverid']/username/text()" $$settings) password $$(xpath -q -e "//servers/server[id='$$serverid']/password/text()" $$settings) >$$HOME/.netrc ; \
	chmod 600 $$HOME/.netrc ; cat $$HOME/.netrc ; \
	case "$$MVN_PROJECT_VERSION" in *SNAPSHOT ) export subdir=snapshots SNAPSHOT=-SNAPSHOT ;; * ) export subdir=releases SNAPSHOT= ;; esac ; \
	export MVN_VERSION_ONLY=$${MVN_PROJECT_VERSION%%-SNAPSHOT} ; \
	REPO=$$MVN_NEXUSPROXY/content/sites/raw/$$MVN_PROJECT_GROUPID/$$subdir/debs ; \
	REPO2=$$MVN_NEXUSPROXY/content/sites/raw/$$MVN_PROJECT_GROUPID/debs ; \
	export REPACKAGEDEBIANUPLOAD="set -x; curl -X PUT -H 'Content-Type:application/octet-stream' --netrc --upload-file '{0}' --url '$$REPO/{1}'" ; \
	export REPACKAGEDEBIANUPLOAD2="set -x; curl -X PUT -H 'Content-Type:application/octet-stream' --netrc --upload-file '{0}' --url '$$REPO2/{1}'" ; \
	export PATH=$$PATH:$$(pwd)/bin; \
	env | sort ; \
	for i in $(STAGEDIRS); do ( cd $$i/src && $(MAKE) debian ) done
