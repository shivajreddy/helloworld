version: '3'

services:
  app:
    build: .
    ports:
      - "8080:8080"  # Go API
      - "3000:3000"  # React dev server (if needed)
    volumes:
      - .:/app
      - /app/node_modules  # Don't override node_modules
    environment:
      - GO111MODULE=on
      - DATABASE_URL=postgres://postgres:postgres@db:5432/myapp
    depends_on:
      - db

  db:
    image: postgres:14
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=postgres
      - POSTGRES_DB=myapp
    volumes:
      - postgres_data:/var/lib/postgresql/data
    ports:
      - "5432:5432"

volumes:
  postgres_data:
