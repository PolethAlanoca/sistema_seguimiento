-- Consulta: Listar tareas de un proyecto con su prioridad y estado
SELECT 
    p.nombre AS nombre_proyecto,
    t.titulo AS titulo_tarea,
    t.descripcion,
    e.estado AS estado_tarea,
    pr.prioridad
FROM tarea t
JOIN proyecto p ON t.id_proyecto = p.id
JOIN estado_tarea e ON t.id_estado = e.id
JOIN prioridad pr ON t.id_prioridad = pr.id;

--Consulta: Ver tareas asignadas a un usuario específico (por nombre)

SELECT 
    u.nombre_completo,
    t.titulo,
    t.descripcion,
    t.id_proyecto,
    a.fecha_asignacion
FROM asignacion_tarea a
JOIN tarea t ON a.id_tarea = t.id
JOIN usuario u ON a.id_usuario = u.id
WHERE u.nombre_completo = 'María Pérez';

--Tareas con información de usuario asignado y proyecto
CREATE VIEW vista_tareas_asignadas AS
SELECT 
    t.titulo,
    t.descripcion,
    p.nombre AS proyecto,
    u.nombre_completo AS asignado_a,
    a.fecha_asignacion
FROM tarea t
JOIN proyecto p ON t.id_proyecto = p.id
JOIN asignacion_tarea a ON a.id_tarea = t.id
JOIN usuario u ON a.id_usuario = u.id;

--Insertar un nuevo comentario
CREATE PROCEDURE sp_insertar_comentario
    @id_tarea INT,
    @id_usuario INT,
    @contenido VARCHAR(MAX),
    @fecha DATETIME
AS
BEGIN
    INSERT INTO comentario (id_tarea, id_usuario, contenido, fecha_comentario)
    VALUES (@id_tarea, @id_usuario, @contenido, @fecha);
END;

EXEC sp_insertar_comentario 5, 2, 'Se completó el módulo principal.', '2024-06-08 14:30:00';

SELECT * FROM comentario
--Obtener el número de tareas asignadas a un usuario

CREATE FUNCTION fn_tareas_asignadas (@id_usuario INT)
RETURNS INT
AS
BEGIN
    DECLARE @total INT;
    SELECT @total = COUNT(*) FROM asignacion_tarea WHERE id_usuario = @id_usuario;
    RETURN @total;
END;

SELECT dbo.fn_tareas_asignadas(3) AS total_tareas;

--Proyectos con cantidad de tareas

CREATE VIEW vista_proyectos_con_tareas AS
SELECT 
    p.nombre,
    COUNT(t.id) AS cantidad_tareas
FROM proyecto p
LEFT JOIN tarea t ON t.id_proyecto = p.id
GROUP BY p.nombre;

--Cambiar el estado de una tarea

CREATE PROCEDURE sp_actualizar_estado_tarea
    @id_tarea INT,
    @nuevo_estado INT
AS
BEGIN
    UPDATE tarea
    SET id_estado = @nuevo_estado
    WHERE id = @id_tarea;
END;

EXEC sp_actualizar_estado_tarea 3, 2;

SELECT * FROM tarea
--