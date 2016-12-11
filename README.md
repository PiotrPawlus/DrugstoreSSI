# Drugstore

###Database
* [PostgreSQL](https://www.postgresql.org/download/)
* Connect with postgresql (psql)
```
  ~ > psql
```
* Creating user
```
 user=# CREATE ROLE drugstore_superuser WITH SUPERUSER LOGIN PASSWORD 'drugstore1234';
```
* Exit psql, login into psql using 'drugstore_superuser'
```
 \q
 psql -d postgres -U drugstore_superuser
```
* Create Database - code included in database.sql
```
  CREATE DATABASE drugstore;
```
* Connect with new created database
```
  \c drugstore
```
* Create Tables - code included in database.sql
```
  Create Table A ();
```

###IDE
* [IntelliJ IDEA Ultimate trial](https://www.jetbrains.com/idea/download/)

###Frameworks
* [Spring MVC](https://spring.io/)
* [Hibernate](http://hibernate.org/)

###Server
* [Apache Tomcat 9](http://tomcat.apache.org/download-90.cgi)

###Useful Materials
* [Hibernate Tutorial](http://www.mastertheboss.com/jboss-frameworks/maven-tutorials/maven-hibernate-jpa/maven-and-hibernate-4-tutorial)
