go=../../../../buildjars/gnu_getopt.jar
cu=../../../../cdf-util/src/main/java/cdf-util.jar

.SUFFIXES= .class

JAVA=org/onap/dcae/cdf/CdfPropValue.java
CLASSES=$(JAVA:.java=.class)

all:

build: cdf-prop-value.jar

classes: $(CLASSES)

clean:
	find . -name '*.class' -exec rm -f {} +
	rm -rf javadoc javadoc.built

cdf-prop-value.jar: $(CLASSES)
	rm -f cdf-prop-value.jar
	jar cvf cdf-prop-value.jar $(CLASSES)

$(CLASSES): $(JAVA)
	javac -cp $(go):$(cu) $(JAVA)

javadocs: javadocs.built
javadocs.built: cdf-prop-value.jar
	rm -rf javadoc
	mkdir -p javadoc
	javadoc -d javadoc -classpath $(go):$(cu) $(JAVA)
	touch javadocs.built
