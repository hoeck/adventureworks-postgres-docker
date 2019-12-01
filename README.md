# AdventureWorks Postgres Docker Image

Serve the [Microsoft AdventureWorks Sql Server Example Database](https://github.com/microsoft/sql-server-samples/tree/master/samples/databases/adventure-works)
converted to PostgreSQL with [AdventureWorks-For-Postgres](https://github.com/lorint/AdventureWorks-for-Postgres).

## Building

```
docker build . --tag adventureworks-postgres
```

## Running

```
docker run --rm --detach --name adventureworks-postgres --publish 54320:5432 adventureworks-postgres:latest
```

## Using

From the commandline with a locally installed `psql`:

```
psql --host=localhost --port=54320 --username=postgres --no-password AdventureWorks
```

Or via docker with `psql` from the image:
```
docker run -it --rm --network=host adventureworks-postgres:latest psql --host=localhost --port=54320 --username=postgres --no-password AdventureWorks
```

# TODO

* push to dockerhub
* push to github repository
* use github actions to automate pushing
