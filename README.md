# Sistema de Seguimiento
El sistema permite registrar, planificar y hacer seguimiento al desarrollo de proyectos y sus tareas, asignar responsables, registrar avances, controlar tiempos y facilitar la colaboración entre los usuarios.

1. Usuario: id_usuario (PK), nombre_completo, correo, contraseña, fecha_registro, rol_global (ej: administrador, colaborador)

   Relación: Participa en múltiples proyectos. Puede comentar tareas. Puede estar asignado a varias tareas.

2. Proyecto: id_proyecto (PK), nombre, descripcion, fecha_inicio, fecha_fin, estado (activo, pausado, finalizado), id_creador (FK a Usuario)

   Relación: Tiene muchas tareas. Tiene muchos participantes (relación muchos a muchos con Usuario mediante Proyecto_Usuario).

3. Proyecto_Usuario: id_proyecto_usuario (PK), id_proyecto (FK), id_usuario (FK), rol_en_proyecto (ej: líder, analista, desarrollador), fecha_ingreso

4. Tarea: id_tarea (PK), id_proyecto (FK), titulo, descripcion, fecha_inicio, fecha_limite, estado (pendiente, en progreso, completada, archivada, cancelada), prioridad (alta, media, baja), porcentaje_avance (entre 0 y 100)

   Relación: Pertenece a un proyecto. Puede estar asignada a uno o varios usuarios (tabla intermedia Asignacion_Tarea). Tiene comentarios.

5. Asignacion_Tarea: id_asignacion (PK), id_tarea (FK), id_usuario (FK), fecha_asignacion

6. Comentario: id_comentario (PK), id_tarea (FK), id_usuario (FK), contenido, fecha_comentario

Diagrama E/R
![image](https://github.com/user-attachments/assets/a47225b4-5965-4603-a080-75938e6ce198)

Diagrama Relacional - Modelo Lógico
![sistema_seguimiento_1](https://github.com/user-attachments/assets/9344a908-b960-4636-892e-901a09e83384)

Diagrama Relacional - Modelo Físico
![image](https://github.com/user-attachments/assets/5bec9f1d-89d6-4eb7-9cd3-b35a8a20fb87)
