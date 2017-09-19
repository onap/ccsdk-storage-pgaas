
DEVBIN=../../bin
PKG=pgaas
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

clean-testlock:
	cd testlock && $(MAKE) clobber

clean: clean-ins clean-testlock
	rm -rf *~ nohup.out

testlock/testlock:
	cd testlock && $(MAKE) testlock

build: testlock/testlock

stage: build clean-stage clean-common
	mkdir -p $(INS)
	cd stage/opt/app/pgaas && $(MAKE) stage STAGEDIR=../../../../$(INSSTG)
	cd testlock && $(MAKE) stage STAGEDIR=../$(INSSTG) DISTPATH=opt/app/pgaas
	find common ! -name makefile ! -name '*~' | cpio -pudmv $(INS)


debian: stage
	sed 's/$${RELLONG}/'"$$MVN_VERSION_ONLY/" < repackage.json > $(INS)/repackage.json
	repackage -b debian $(REPACKAGEDEBIANOPTS) -d $(INS) -u -X "{appname}.{suffix},{appname}.{suffix}-{version},{appname}.{suffix}-{version}-{datetime}" -y $(INS)/repackage.json
	@echo debian built

upload-javadocs:
	@echo nothing to do here

