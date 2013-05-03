# Nitrogen Benchmarking Test

This is the Nitrogen Web Framework (with Cowboy as the backend) portion of a [benchmarking test suite](../) comparing a variety of web development platforms.

### JSON Encoding Test

* [JSON test page](src/json.erl)


### Data-Store/Database Mapping Test

* [DB test page](src/dbpage.erl)


### Fortune Test

* [Fortune test page](src/fortune.erl)

## Infrastructure Software Versions
The tests were run with:

* [Nitrogen 2.1.0](https://github.com/nitrogen/nitrogen)
* [Cowboy 0.8.3](https://github.com/extend/cowboy)
* [Erlang R16B](http://www.erlang.org/)
* [MySQL 5.5.31](https://dev.mysql.com/)

## Test URLs
### JSON Encoding Test

http://localhost/json

### Data-Store/Database Mapping Test

http://localhost/dbpage

### Variable Query Test
    
http://localhost/dbpage?queries=2

### Fortune Test

http://localhost/fortune
