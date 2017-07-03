Monitor
===============================
###1. Maven dependencies

mvn clean
mvn install:install-file -Dfile=oracle-jdbc/ojdbc14.jar -DgroupId=com.oracle -DartifactId=ojdbc14 -Dversion=10.2.0.4.0 -Dpackaging=jar -DgeneratePom=true
mvn install -X -U
mvn compile

###2. To Run this project locally
```shell
$ mvn jetty:run
```
Access ```http://localhost:8080/Monitor/login.xhtml```

###3. To import this project into Eclipse IDE
1. ```$ mvn eclipse:eclipse```
2. Import into Eclipse via **existing projects into workspace** option.
3. Done.

