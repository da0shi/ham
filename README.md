ham (householding account manager)
=====

Simple householding account manager

Get Started
-----

- Install all requirements
  - Except database; docker handle those things
- Run `docker-compose up -d` to run database container
- Run `migrate -source file://migrations -database postgres://sample:password@localhost:5432/sample?sslmode=disable up` to execute necessary migrations for the first time

Requirements
-----

- [Docker](https://hub.docker.com/editions/community/docker-ce-desktop-mac) - Virtualization
- [PostgreSQL 9.6.11](https://www.postgresql.org/docs/9.6/release-9-6-11.html) - Database
- [migrate](https://github.com/golang-migrate/migrate/tree/master/cli) - Database migration tool

Tech Stack
------

* Backend
  * [Gin-Gonic](https://gin-gonic.com/)
    * Go based simple web server framework
  * [sqlx](http://jmoiron.github.io/sqlx/)
    * Extension library for 'database/sql' to ease data mapping
* Frontend
  * [elm](https://elm-lang.org)

Initial, Minimal, Specifications
=====

- Add payment record
- List payment records
- Update payment record
- Delete payment record
