
INSERT INTO estado_proyecto (estado)
VALUES ('Activo'), ('En pausa'), ('Finalizado'),
	   ('Cancelado'), ('Planificado'),
	   ('Retrasado'), ('Archivado');
	   
INSERT INTO rol_proyecto (rol) VALUES
('Líder de Proyecto'), ('Desarrollador'), ('Analista'),
('Tester'), ('Diseñador UI/UX'), ('Scrum Master'),
('DevOps'), ('Arquitecto de software'), ('Product Owner'), ('Soporte');

INSERT INTO estado_tarea (estado) VALUES
('Pendiente'), ('En proceso'), ('Completada'),
('Cancelada'), ('En revisión'), ('Asignada'),
('En pruebas'), ('Detenida'), ('Validada'), ('Rechazada');

INSERT INTO prioridad (prioridad) VALUES
('Alta'), ('Media'), ('Baja');

INSERT INTO usuario (nombre_completo, correo, contraseña, fecha_registro, rol_global) VALUES
('María Pérez', 'maria.perez@example.com', '123456', '2023-01-07 19:35:25.557', 'Administrador'),
('Juan Torres', 'juan.torres@example.com', 'abcdef', '2023-03-20 19:40:01.557', 'Administrador'),
('Lucía García', 'lucia.garcia@example.com', 'qwerty', '2023-03-28 09:58:30.557', 'Colaborador'),
('Pedro Ramos', 'pedro.ramos@example.com', 'pass123', '2023-05-11 11:10:35.557', 'Colaborador'),
('Ana Flores', 'ana.flores@example.com', 'clave456', '2024-02-23 13:20:40.557', 'Colaborador'),
('Carlos Vega', 'carlos.vega@example.com', 'devpass', '2024-06-10 15:42:50.557', 'Colaborador'),
('Isabel Ruiz', 'isabel.ruiz@example.com', 'pwd456', '2024-08-28 10:53:02.557', 'Colaborador'),
('Diego Soto', 'diego.soto@example.com', 'adminpass', '2024-10-10 08:05:11.557', 'Colaborador'),
('Elena Ríos', 'elena.rios@example.com', 'uiux123', '2024-12-01 12:12:30.557', 'Colaborador'),
('Luis Mendoza', 'luis.mendoza@example.com', 'soporte123', getdate(), 'Colaborador');

INSERT INTO proyecto (nombre, descripcion, fecha_inicio, fecha_fin, id_estado) VALUES
('Sistema de Ventas', 'Web para ventas de productos', '2024-01-03', '2024-08-01', 7),
('App de Tareas', 'App móvil de productividad', '2024-02-10', '2025-05-30', 2),
('Gestor Escolar', 'Sistema de matrículas', '2024-03-15', '2025-06-20', 1),
('CRM Web', 'Gestión de clientes', '2024-01-20', '2024-08-10', 3),
('E-commerce', 'Tienda online', '2025-03-01', '2025-07-01', 4),
('Intranet', 'Sistema interno de empresa', '2025-04-05', '2025-08-15', 5),
('Gestión de Inventario', 'Sistema para almacenes', '2025-01-10', '2025-04-20', 5),
('Blog Empresarial', 'Sitio web de noticias internas', '2025-02-20', '2025-05-25', 1);

INSERT INTO proyecto_usuario (id_proyecto, id_usuario, id_rol_proyecto, fecha_ingreso) VALUES
(1, 1, 1, '2023-12-23 13:20:40.557'), (1, 2, 2,'2023-12-23 13:20:40.557'), (2, 3, 3, '2023-12-23 13:20:40.557'),
(3, 4, 4, '2023-12-23 13:20:40.557'), (4, 5, 5, '2023-12-23 13:20:40.557'), (5, 6, 6, '2024-01-05 13:20:40.557'),
(6, 7, 7, '2024-01-05 13:20:40.557'), (7, 8, 8, '2024-01-05 13:20:40.557'), (8, 9, 9, '2024-01-05 13:20:40.557'),
(2, 1, 1, '2024-02-15 09:15:00.000'), (3, 2, 2, '2024-03-01 10:20:00.000'), (4, 3, 3, '2024-04-10 11:30:00.000'),
(5, 4, 4, '2024-05-12 08:45:00.000'), (6, 5, 5, '2024-06-20 14:10:00.000'), (1, 10, 10, '2024-01-05 13:20:40.557');

INSERT INTO tarea (id_proyecto, titulo, descripcion, id_estado, id_prioridad) VALUES
(1, 'Diseñar BD', 'Modelo entidad-relación', 1, 1),
(2, 'Crear UI', 'Pantallas en Figma', 2, 2),
(3, 'Codificar backend', 'Lógica en C#', 3, 3),
(4, 'Subir a GitHub', 'Repositorio del proyecto', 4, 1),
(5, 'Diseñar APIs', 'Endpoints REST', 5, 2),
(6, 'Documentar', 'Manual de usuario', 6, 3),
(7, 'Configurar servidor', 'Hosting en AWS', 7, 1),
(8, 'Pruebas funcionales', 'Verificación', 1, 2),
(2, 'Diseñar logo', 'Branding de la app', 2, 3),
(1, 'Validar requerimientos', 'Análisis funcional', 3, 1);
(3, 'Revisión de requisitos', 'Verificar consistencia de especificaciones', 5, 2),
(4, 'Diseño responsivo', 'Adaptar el sitio a móviles', 6, 1),
(5, 'Test unitarios', 'Cobertura de código', 2, 2),
(6, 'Integración continua', 'Pipeline en GitHub Actions', 1, 3),
(7, 'Optimización de consultas', 'Mejorar rendimiento SQL', 3, 1);

INSERT INTO asignacion_tarea (id_tarea, id_usuario, fecha_asignacion) VALUES
(1, 1, '2024-01-01 13:27:00.557'), (2, 2, '2024-02-01 08:46:10.557'), (3, 3, '2024-03-25 14:30:53.557'),
(4, 4, '2024-02-27 09:00:00.557'), (5, 5, '2025-04-01 11:43:05.557'), (6, 6, '2025-08-01 08:30:00.557'),
(7, 7, '2025-04-01 13:27:00.557'), (8, 8, '2025-05-01 11:45:00.557'), (9, 9, '2024-03-01 18:35:00.557'),
(10, 10, '2024-05-01 13:27:00.557'), (11, 6, '2024-06-21 10:00:00.000'), (12, 7, '2024-06-22 11:30:00.000'),
(13, 8, '2024-06-23 13:00:00.000'), (14, 9, '2024-06-24 09:15:00.000'), (15, 10, '2024-06-25 08:45:00.000');

INSERT INTO comentario (id_tarea, id_usuario, contenido, fecha_comentario) VALUES
(1, 1, 'Diagrama listo.', '2024-01-01 13:27:00.557'), (2, 2, 'Subí las pantallas.', '2024-03-01 08:46:10.557'),
(3, 3, 'Backend iniciado.', '2024-03-30 14:30:53.557'), (4, 4, 'Código en Git.', '2024-03-03 09:00:00.557'),
(5, 5, 'APIs listas.', '2025-04-30 11:43:05.557'), (6, 6, 'Manual en progreso.', '2025-08-02 08:30:00.557'),
(7, 7, 'Configurando el servidor.', '2025-04-07 13:27:00.557'), (8, 8, 'Pruebas completadas.', '2025-05-04 11:45:00.557'),
(9, 9, 'Diseño aprobado.', '2024-03-17 18:35:00.557'), (10, 10, 'Requisitos confirmados.', '2024-05-03 13:27:00.557'),
(11, 6, 'Revisión realizada, todo conforme.', '2024-06-21 16:30:00.000'), (12, 7, 'Diseño adaptado correctamente.', '2024-06-22 17:00:00.000'),
(13, 8, 'Tests agregados al repositorio.', '2024-06-23 18:20:00.000'), (14, 9, 'Pipeline configurado y funcional.', '2024-06-24 19:10:00.000'),
(15, 10, 'Consultas optimizadas con índices.', '2024-06-25 20:00:00.000');

