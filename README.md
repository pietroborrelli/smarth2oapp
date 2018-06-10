# smarth2oapp

Render to final users, hourly water consumption in a interactive histogram<br>
smarth2oapp requests data to REST services by using Ajax

## Getting Started
Download Eclipse (v.>=4.7.3a) and install Java (v.>=1.8).
Install Spring Tools, in Eclipse Marketplace
```
Help -> Eclipse Marketplace -> Search 'Spring Tools' (v.>=3.9.4) -> Install and restart Eclipse
```
Import project in your workspace, then in Eclipse :
```
File -> Import -> Existing Project into Workspace
```
It'a a Maven Project, so each dependency will resolve automatically
```
Right click on project -> Maven -> Update Project
```

### Prerequisites

You need to have a working Cassandra database instance, populated with hourly registers. if you haven't, please follow before <a href="https://github.com/pietroborrelli/spring-data-cassandra" target="_blank" >this</a> guide.
<br>
An active <a href="https://github.com/pietroborrelli/PolimiRESTServices/">REST service</a>

### Installing

Have a look in your build path, to check, in Libraries tab, that JRE is correctly set on a version >= 1.8

## Running 

Right click on the project and Run As Spring Boot App OR Run from Boot Dashboard (preferred)<br>

## Built With

* [Spring Boot](https://spring.io/projects/spring-boot) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [Lombok](https://projectlombok.org/) - Easy access Java functions
* [JQuery](http://jquery.com/) - JS library
* [HighCharts](https://www.highcharts.com/) - JS graph library

## Versioning

I use [SourceTree](https://www.sourcetreeapp.com/) as Git desktop client for versioning. But you may use your preferred  version control system.

## Authors

* **Pietro Borrelli** - *Initial work*

## Acknowledgments

* Thesis Research project - Politecnico di Milano
