# School Database

Base de datos PostgreSQL para el sistema de colegio.

## Entidades

| Tabla         | Descripción                            |
|---------------|----------------------------------------|
| `teachers`    | Profesores que dictan materias         |
| `students`    | Estudiantes con grado asignado         |
| `enrollments` | Matrículas que conectan student↔teacher |

## Relaciones

- Un **teacher** puede tener muchas **enrollments**
- Un **student** puede tener muchas **enrollments**
- `enrollments` es la tabla intermedia (relación N:M)

## Archivos

| Archivo            | Qué es                                  |
|--------------------|-----------------------------------------|
| `schema.ddl`       | CREATE TABLE — estructura de tablas     |
| `data.dml`         | INSERT — datos iniciales                |
| `init.sql`         | DDL + DML combinados (para Docker)      |
| `Dockerfile`       | Imagen PostgreSQL con tablas incluidas  |
| `docker-compose.yml` | Orquestación del contenedor           |

## Cómo levantar la base de datos

```bash
docker-compose up
```

Eso hace automáticamente:
1. Levanta PostgreSQL en el puerto 5433
2. Crea las 3 tablas
3. Inserta los datos iniciales

## Credenciales

| Campo    | Valor        |
|----------|--------------|
| Host     | localhost    |
| Puerto   | 5433         |
| DB       | school_db    |
| Usuario  | school_user  |
| Password | school_pass  |

## Conectar desde el backend (Spring Boot)

```properties
spring.datasource.url=jdbc:postgresql://localhost:5433/school_db
spring.datasource.username=school_user
spring.datasource.password=school_pass
```
