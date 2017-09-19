
DEVBIN=../../bin
PKG=cdf
REPACKAGEDEBIANOPTS=

INS=	../install
INSSTG=	$(INS)/stage
INSCOM=	$(INS)/common
KEEP=

all:

clean-stage:
	rm -rf $(INSSTG)

clean-common:
	rm -rf $(INSCOM)

clean-ins: clean-stage clean-common
	rm -rf $(INS)

clean: clean-ins
	rm -rf *~
	cd cdf-prop-value && $(MAKE) clean

build: javadocs build-java

build-java:
	cd cdf-prop-value && $(MAKE) build

javadocs:
	cd cdf-prop-value && $(MAKE) javadocs

stage: build clean-stage clean-common
	mkdir -p $(INS)
	find stage common ! -name makefile ! -name '*~' | cpio -pudmv $(INS)
	cp -p cdf-prop-value/cdf-prop-value/src/main/java/cdf-prop-value.jar $(INS)/stage/opt/app/cdf/lib/cdf-prop-value-1.1.0.jar
	cp -p cdf-prop-value/cdf-prop-value/src/main/java/cdf-prop-value.jar $(INS)/stage/opt/app/cdf/lib/cdf-prop-value.jar
	cp -p cdf-prop-value/cdf-util/src/main/java/cdf-util.jar $(INS)/stage/opt/app/cdf/lib/jars/cdf-util-1.1.0.jar
	cp -p cdf-prop-value/cdf-util/src/main/java/cdf-util.jar $(INS)/stage/opt/app/cdf/lib/jars/cdf-util.jar
	chmod a+x $(INSCOM)/*


debian: stage
	sed 's/$${RELLONG}/'"$$MVN_VERSION_ONLY/" < repackage.json > $(INS)/repackage.json
	repackage -b debian $(REPACKAGEDEBIANOPTS) -d $(INS) -u -X "{appname}.{suffix},{appname}.{suffix}-{version}$$SNAPSHOT,{appname}.{suffix}-{version}$$SNAPSHOT-{datetime}" -y $(INS)/repackage.json
	@echo debian built

upload-javadocs: javadocs
	cd cdf-prop-value && find cdf-*/src/main/java/javadoc -type f | while read f; do \
		curl -k --user "$${ONAP_NEXUS_USER}:$${ONAP_NEXUS_PASSWORD}" --upload-file "$$f" "$${ONAP_NEXUS_JAVADOC}/org.onap.dcae.storage.cdf/1.1.0/$$f"; \
	done

