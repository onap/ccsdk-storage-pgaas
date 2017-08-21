
go=../../../../buildjars/gnu_getopt.jar

.SUFFIXES= .class

JAVA=	org/onap/dcae/cdf/util/common/Classify.java \
	org/onap/dcae/cdf/util/common/Tuple3.java \
	org/onap/dcae/cdf/util/common/AsHex.java \
	org/onap/dcae/cdf/util/common/G2CookieGen.java \
	org/onap/dcae/cdf/util/common/Compress.java \
	org/onap/dcae/cdf/util/common/Pair.java \
	org/onap/dcae/cdf/util/common/Tuple4.java \
	org/onap/dcae/cdf/util/common/Hostname.java \
	org/onap/dcae/cdf/util/common/Uid.java \
	org/onap/dcae/cdf/util/common/Tuple2.java \
	org/onap/dcae/cdf/util/common/Pid.java \
	org/onap/dcae/cdf/util/common/Convert.java \
	org/onap/dcae/cdf/util/common/Popen.java \
	org/onap/dcae/cdf/util/config/PropValue.java \
	org/onap/dcae/cdf/util/config/Configuration.java \
	org/onap/dcae/cdf/util/config/EncryptedConfiguration.java \
	org/onap/dcae/cdf/util/config/Configurable.java \
	org/onap/dcae/cdf/util/config/ConfigurationRegistry.java \
	org/onap/dcae/cdf/util/threads/TaskThread.java \
	org/onap/dcae/cdf/util/threads/ThreadUtils.java

CLASSES=$(JAVA:.java=.class)

all:

build: cdf-util.jar

cdf-util.jar: $(CLASSES)
	rm -f cdf-util.jar
	jar cvf cdf-util.jar $(CLASSES)

clean: 
	find . -name '*.class' -exec rm -f {} +
	rm -rf javadoc javadocs.built

$(CLASSES): $(JAVA)
	javac -cp $(go) $(JAVA)

javadocs: javadocs.built
javadocs.built: cdf-util.jar
	rm -rf javadoc
	mkdir -p javadoc
	javadoc -d javadoc -classpath $(go) $(JAVA)
	touch javadocs.built
