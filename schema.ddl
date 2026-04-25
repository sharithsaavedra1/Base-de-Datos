-- ================================================
-- COLEGIO - DDL (Data Definition Language)
-- Autor: Tu Nombre
-- Descripción: Estructura de tablas del sistema
-- ================================================

DROP TABLE IF EXISTS enrollments CASCADE;
DROP TABLE IF EXISTS students   CASCADE;
DROP TABLE IF EXISTS teachers   CASCADE;

-- ────────────────────────────────────────────────
-- Tabla: teachers (Profesores)
-- ────────────────────────────────────────────────
CREATE TABLE teachers (
    id         SERIAL        PRIMARY KEY,
    name       VARCHAR(100)  NOT NULL,
    email      VARCHAR(150)  NOT NULL UNIQUE,
    subject    VARCHAR(100)  NOT NULL,
    phone      VARCHAR(20),
    created_at TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);

-- ────────────────────────────────────────────────
-- Tabla: students (Estudiantes)
-- ────────────────────────────────────────────────
CREATE TABLE students (
    id         SERIAL        PRIMARY KEY,
    name       VARCHAR(100)  NOT NULL,
    email      VARCHAR(150)  NOT NULL UNIQUE,
    grade      VARCHAR(20)   NOT NULL,
    birth_date DATE,
    created_at TIMESTAMP     DEFAULT CURRENT_TIMESTAMP
);

-- ────────────────────────────────────────────────
-- Tabla: enrollments (Matrículas)
-- Relaciona students ↔ teachers
-- Un estudiante puede tener muchas matrículas
-- Un profesor puede tener muchos estudiantes
-- ────────────────────────────────────────────────
CREATE TABLE enrollments (
    id           SERIAL       PRIMARY KEY,
    student_id   INT          NOT NULL REFERENCES students(id) ON DELETE CASCADE,
    teacher_id   INT          NOT NULL REFERENCES teachers(id) ON DELETE CASCADE,
    enrolled_at  DATE         NOT NULL DEFAULT CURRENT_DATE,
    status       VARCHAR(20)  NOT NULL DEFAULT 'active'
                              CHECK (status IN ('active','inactive','completed')),
    grade_score  NUMERIC(4,2) CHECK (grade_score >= 0 AND grade_score <= 10),
    created_at   TIMESTAMP    DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uk_student_teacher UNIQUE (student_id, teacher_id)
);
