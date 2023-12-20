# Dating Apps API

Dating Apps API is an API that can be used for users to access other users' profiles and provide like or pass.

### 1. Requirement
- Go
- PostgreSQL
- Docker (optional)

### 2. Project Structure
- [cmd](https://github.com/Alitindrawan24/dating-apps-api/tree/main/cmd)
- [database](https://github.com/Alitindrawan24/dating-apps-api/tree/main/database)
- [internal](https://github.com/Alitindrawan24/dating-apps-api/tree/main/internal)
    - [app](https://github.com/Alitindrawan24/dating-apps-api/tree/main/internal/app)
    - [entity](https://github.com/Alitindrawan24/dating-apps-api/tree/main/internal/entity)
    - [handler](https://github.com/Alitindrawan24/dating-apps-api/tree/main/internal/handler)
    - [middleware](https://github.com/Alitindrawan24/dating-apps-api/tree/main/internal/middleware)
    - [pkg](https://github.com/Alitindrawan24/dating-apps-api/tree/main/internal/pkg)
    - [repository](https://github.com/Alitindrawan24/dating-apps-api/tree/main/internal/repository)
    - [usecase](https://github.com/Alitindrawan24/dating-apps-api/tree/main/internal/usecase)

### 3. Installation & Setup

- Clone project from the repository using http
```bash
git clone https://github.com/Alitindrawan24/dating-apps-api.git
```

- Clone project from the repository if using ssh

```bash
git clone git@github.com:Alitindrawan24/dating-apps-api.git
```

- Create *.env* file from *.env.example* file

```bash
cp .env.example .env
```

- Fill the *.env* file using your own environment


- Install Golang Migrator (for migrate case)
```bash
go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest
```

- Migrate database (installed golang migrator needed)
```bash
make migrate-up
```
or using migrate command if not have installed make
```bash
migrate -database ${DB_MIGRATION_CONNECTION} -path database/migrations up
```

- Seed initial data (installed golang migrator needed)
```bash
make seed
```
or using migrate command if not have installed make
```bash
migrate -database ${DB_SEEDER_CONNECTION} -path database/seeders up
```

- Running the application
```bash
make run
```

- If already have [air](https://github.com/cosmtrek/air) installed, run the application with auto live reload
```bash
air
```

### 4. Deployment

### 5. Testing