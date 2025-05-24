CREATE TABLE Inscripciones (
    IDInscripcion SERIAL PRIMARY KEY,
    IDEstudiante INTEGER REFERENCES Estudiantes(IDEstudiante) ON DELETE CASCADE,
    IDCurso INTEGER REFERENCES Cursos(IDCurso) ON DELETE CASCADE,
    FechaInscripcion DATE,
    Calificacion NUMERIC(4,2)
);

CREATE TABLE Aulas (
    IDAula SERIAL PRIMARY KEY,
    NombreAula VARCHAR(50) NOT NULL,
    Capacidad INTEGER,
    Ubicacion VARCHAR(100)
);

CREATE TABLE Horarios (
    IDHorario SERIAL PRIMARY KEY,
    IDCurso INTEGER REFERENCES Cursos(IDCurso) ON DELETE CASCADE,
    IDAula INTEGER REFERENCES Aulas(IDAula) ON DELETE SET NULL,
    FechaInicio DATE,
    FechaFin DATE,
    HoraInicio TIME,
    HoraFin TIME
);

CREATE TABLE CursosProfesores (
    IDCursoProfesor SERIAL PRIMARY KEY,
    IDCurso INTEGER REFERENCES Cursos(IDCurso) ON DELETE CASCADE,
    IDProfesor INTEGER REFERENCES Profesores(IDProfesor) ON DELETE CASCADE
);

CREATE TABLE ProgramasEstudio (
    IDPrograma SERIAL PRIMARY KEY,
    NombrePrograma VARCHAR(100) NOT NULL,
    DescripcionPrograma TEXT
);

CREATE TABLE ProgramasCursos (
    IDProgramaCurso SERIAL PRIMARY KEY,
    IDPrograma INTEGER REFERENCES ProgramasEstudio(IDPrograma) ON DELETE CASCADE,
    IDCurso INTEGER REFERENCES Cursos(IDCurso) ON DELETE CASCADE
);

CREATE TABLE Campus (
    IDCampus SERIAL PRIMARY KEY,
    NombreCampus VARCHAR(100) NOT NULL,
    DireccionCampus VARCHAR(200)
);

CREATE TABLE Carreras (
    IDCarrera SERIAL PRIMARY KEY,
    NombreCarrera VARCHAR(100) NOT NULL,
    TituloOtorgado VARCHAR(100)
);

ALTER TABLE Estudiantes
ADD COLUMN IDCarrera INTEGER REFERENCES Carreras(IDCarrera);

ALTER TABLE Cursos
ADD COLUMN IDCampus INTEGER REFERENCES Campus(IDCampus);

ALTER TABLE Profesores
ADD COLUMN Email VARCHAR(100) UNIQUE;

ALTER TABLE Estudiantes
DROP COLUMN Ciudad;

ALTER TABLE Horarios
DROP CONSTRAINT IF EXISTS horarios_idaula_fkey;

ALTER TABLE Horarios
DROP COLUMN IF EXISTS IDAula;

DROP TABLE AULAS;

INSERT INTO Campus (NombreCampus, DireccionCampus)
VALUES ('Campus Mexicali', 'Calle Instituto Tecnologico, Mexicali'),
		('Campus Tijuana', 'Calle Rio Nuevo, Tijuana');

		INSERT INTO Carreras (NombreCarrera, TituloOtorgado)
VALUES ('Ingeniería en Sistemas', 'Titulado en Ingeniería de Sistemas'),
       ('Ingenieria en Mecatronica', 'Titulado en Mecatronica'),
	   ('Ingenieria Civil', 'Titulado en Ing. Civil');

	   INSERT INTO Estudiantes (Nombre, Apellido, FechaNacimiento, Direccion, Email, IDCarrera)
VALUES
('Donovan', 'Hernandez', '2002-09-19', 'Cerritos, Mexicali', 'donovan.hernandez@gmail.com', 1),
('Damian', 'Lugo', '2005-06-22', 'Av. Real 456, Mexicali', 'damian@gmail.com', 2),
('Alonso', 'Guevara', '2004-11-10', 'Calle Libertad 789, Mexicali', 'alonso@gmail.com', 3),
('Juanito', 'Alcachofa', '1995-02-01', 'Calle Jardín 101, Tijuana', 'juanito@gmail.com', 2),
('Emanuel', 'Padilla', '1999-07-30', 'Calle Sol 202, Mexicali', 'emanuel@gmail.com', 1),
('Miguel', 'Hidalgo', '1995-05-25', 'Calle Historia 303, Tijuana', 'miguel@gmail.com', 3);

UPDATE Estudiantes
SET Email = 'donovan,hdez@gmail.com'
WHERE IDEstudiante = 1;

UPDATE Estudiantes
SET IDCarrera = 1  
WHERE IDEstudiante = 4;

DELETE FROM Estudiantes
WHERE IDEstudiante = 3;

SELECT E.Nombre, E.Apellido, C.NombreCarrera
FROM Estudiantes E
JOIN Carreras C ON E.IDCarrera = C.IDCarrera;

SELECT Nombre, Apellido
FROM Estudiantes;

INSERT INTO Departamentos (NombreDepartamento, Edificio)
VALUES
('Matemáticas', 'Edificio A'),
('Filosofía', 'Edificio B'),
('Ciencias de la Computación', 'Edificio C'),
('Humanidades', 'Edificio D');

INSERT INTO Cursos (NombreCurso, Descripcion, Creditos, Semestre, IDDepartamento)
VALUES 
('Ecuaciones', 'Curso de Ecuaciones Diferenciales', 3, 'Primero', 1),
('Ética', 'Curso de Ética Profesional', 3, 'Segundo', 2),
('Programación', 'Curso de Programación en C', 3, 'Tercero', 3),
('Lectura', 'Curso de Lectura Crítica y Comprensión', 3, 'Cuarto', 4);

INSERT INTO Cursos (NombreCurso, Descripcion, Creditos, Semestre, IDDepartamento)
VALUES 
('Ecuaciones', 'Curso de Ecuaciones Diferenciales', 3, 'Primero', 1),
('Ética', 'Curso de Ética Profesional', 3, 'Segundo', 2),
('Programación', 'Curso de Programación en C', 3, 'Tercero', 3),
('Lectura', 'Curso de Lectura Crítica y Comprensión', 3, 'Cuarto', 4);

INSERT INTO Cursos (IDCurso, NombreCurso, Descripcion, Creditos, Semestre, IDDepartamento)
VALUES 
(1, 'Ecuaciones', 'Curso de Ecuaciones Diferenciales', 3, 'Primero', 1),
(2, 'Ética', 'Curso de Ética Profesional', 3, 'Segundo', 2),
(3, 'Programación', 'Curso de Programación en C', 3, 'Tercero', 3),
(4, 'Lectura', 'Curso de Lectura Crítica y Comprensión', 3, 'Cuarto', 4);

INSERT INTO Inscripciones (IDEstudiante, IDCurso, FechaInscripcion, Calificacion)
VALUES 
(1, 1, '2023-08-01', 9.5), 
(1, 2, '2023-08-01', 8.0),
(2, 3, '2023-08-01', 7.5),
(4, 1, '2023-08-01', 8.5),
(5, 2, '2023-08-01', 9.0),
(6, 3, '2023-08-01', 6.5);

SELECT NombreCurso
FROM Cursos
WHERE Creditos = 3;

SELECT E.Nombre AS Estudiante, E.Apellido, C.NombreCurso
FROM Estudiantes E
JOIN Inscripciones I ON E.IDEstudiante = I.IDEstudiante
JOIN Cursos C ON I.IDCurso = C.IDCurso;

SELECT C.NombreCurso, E.Nombre AS Estudiante, E.Apellido
FROM Cursos C
RIGHT JOIN Inscripciones I ON C.IDCurso = I.IDCurso
RIGHT JOIN Estudiantes E ON I.IDEstudiante = E.IDEstudiante;

SELECT C.NombreCurso, COUNT(I.IDInscripcion) AS NumeroDeEstudiantes
FROM Cursos C
LEFT JOIN Inscripciones I ON C.IDCurso = I.IDCurso
GROUP BY C.IDCurso;

SELECT Nombre, Apellido
FROM Estudiantes
WHERE FechaNacimiento BETWEEN '1995-01-01' AND '1998-12-31';

SELECT NombreCurso
FROM Cursos
ORDER BY NombreCurso ASC;

WITH InscripcionesPorEstudiante AS (
    SELECT E.IDEstudiante, E.Nombre, E.Apellido, COUNT(I.IDInscripcion) AS NumeroDeInscripciones
    FROM Estudiantes E
    LEFT JOIN Inscripciones I ON E.IDEstudiante = I.IDEstudiante
    GROUP BY E.IDEstudiante
)
SELECT Nombre, Apellido, NumeroDeInscripciones
FROM InscripcionesPorEstudiante
ORDER BY NumeroDeInscripciones DESC
LIMIT 3;

WITH CursosConInscripciones AS (
    SELECT C.IDCurso, C.NombreCurso, C.IDDepartamento, COUNT(I.IDInscripcion) AS NumeroDeInscripciones
    FROM Cursos C
    LEFT JOIN Inscripciones I ON C.IDCurso = I.IDCurso
    GROUP BY C.IDCurso
)
SELECT D.NombreDepartamento, C.NombreCurso
FROM CursosConInscripciones C
JOIN Departamentos D ON C.IDDepartamento = D.IDDepartamento
WHERE C.NumeroDeInscripciones = (
    SELECT MAX(NumeroDeInscripciones)
    FROM CursosConInscripciones
    WHERE IDDepartamento = C.IDDepartamento
);

INSERT INTO Profesores (Nombre, Apellido, Titulo, IDDepartamento)
VALUES 
('Jose', 'Bogarin', 'Doctor en Matemáticas', 1),  
('Ana', 'Lepe', 'Licenciada en Ciencias de la Computación', 3), 
('Luis', 'Alvarado', 'Doctor en Filosofía', 2),  
('Daniel', 'Larusso', 'Licenciada en Literatura', 4); 

INSERT INTO CursosProfesores (IDCurso, IDProfesor)
VALUES
(1, 1),  
(3, 1),  
(2, 2),  
(4, 2); 

INSERT INTO ProgramasEstudio (NombrePrograma, DescripcionPrograma)
VALUES 
('Ingeniería de Sistemas', 'Programa de estudios orientado a la tecnología y la informática'),
('Ingeniería Mecatrónica', 'Programa de estudios interdisciplinario entre la ingeniería mecánica y electrónica'),
('Ingeniería Civil', 'Programa de estudios enfocado en la construcción y el diseño de infraestructuras'),
('Ciencias Sociales', 'Programa de estudios centrado en la filosofía, sociología y psicología');

INSERT INTO ProgramasCursos (IDPrograma, IDCurso)
VALUES
(1, 1),  
(1, 3),  
(2, 1),  
(2, 4),  
(3, 2),  
(3, 4),  
(4, 2),  
(4, 4); 

WITH PromedioCalificacion AS (
    SELECT IC.IDCurso, AVG(IC.Calificacion) AS PromedioCalificacion
    FROM Inscripciones IC
    GROUP BY IC.IDCurso
)
SELECT P.NombrePrograma, C.NombreCurso
FROM PromedioCalificacion PC
JOIN Cursos C ON PC.IDCurso = C.IDCurso
JOIN ProgramasEstudio P ON C.IDDepartamento = P.IDPrograma
WHERE PC.PromedioCalificacion = (
    SELECT MAX(PromedioCalificacion)
    FROM PromedioCalificacion
    WHERE IDCurso = PC.IDCurso
);

SELECT P.Nombre, P.Apellido, COUNT(CP.IDCurso) AS NumeroDeCursos
FROM Profesores P
JOIN CursosProfesores CP ON P.IDProfesor = CP.IDProfesor
GROUP BY P.IDProfesor
HAVING COUNT(CP.IDCurso) > 2;