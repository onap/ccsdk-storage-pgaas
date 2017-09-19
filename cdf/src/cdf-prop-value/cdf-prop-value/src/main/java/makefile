go=$$(find ~/.m2 -name '*getopt*.jar' | tail -1)
cu=../../../../cdf-util/src/main/java/cdf-util.jar

.SUFFIXES= .class

JAVA=org/onap/dcae/cdf/CdfPropValue.java
CLASSES=$(JAVA:.java=.class)

JAR=cdf-prop-value.jar

all:

build: $(JAR)

classes: $(CLASSES)

clean:
	find . -name '*.class' -exec rm -f {} +
	rm -rf javadoc javadocs.built $(JAR)

$(JAR): $(CLASSES)
	rm -f $(JAR)
	jar cvf $(JAR) $(CLASSES)

$(CLASSES): $(JAVA)
	javac -cp $(go):$(cu) $(JAVA)

javadocs: javadocs.built
javadocs.built: $(JAR)
	rm -rf javadoc
	mkdir -p javadoc
	javadoc -d javadoc -classpath $(go):$(cu) $(JAVA)
	touch javadocs.built
