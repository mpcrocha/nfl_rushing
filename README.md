# README

### Create the database using docker:

```docker run --name nfl-rushing_db -e POSTGRES_USER=nfl-rushing -e POSTGRES_DB=nfl-rushing -e POSTGRES_PASSWORD='nfl-rushing!23' -d -p 5450:5432 postgres```

### Run migrations
```rake db:migrate:with_data```

### Starts the application 
```rails s -p 3001```

### Run tests
```rspec```
