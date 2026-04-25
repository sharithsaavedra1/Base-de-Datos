FROM postgres:15-alpine

ENV POSTGRES_DB=school_db
ENV POSTGRES_USER=school_user
ENV POSTGRES_PASSWORD=school_pass

COPY init.sql /docker-entrypoint-initdb.d/01-init.sql

EXPOSE 5432
