USE v2019;

-- listar todos
-- SELECT id,nombre,contrasenya FROM usuario ORDER BY id DESC LIMIT 500;

-- busqueda por nombre
SELECT id,nombre,contrasenya FROM usuario WHERE nombre LIKE '%cas%' ORDER BY nombre ASC LIMIT 500;


-- eliminar un usuario por id
DELETE FROM usuario WHERE id = ?;

-- crear un usuario nuevo
INSERT INTO usuario ( nombre, contrasenya) VALUES ( ? , ?);

-- modificar un usuario
UPDATE usuario SET nombre= ?, contrasenya= ? WHERE id = ?;


-- numero de likes del Fary
-- SELECT COUNT(*) as 'numero_likes' FROM likes WHERE video_id = 4;

-- INNER JOIN EXPLICITA
-- mostrar los videos del usuario 'soso' por su id
SELECT 
	u.nombre as 'usuario',
    v.nombre as 'video',
    c.nombre as 'categoria'
FROM 
	usuario as u INNER JOIN video as v ON u.id = v.usuario_id 
    INNER JOIN categoria as c ON c.id = v.categoria_id 
    
WHERE
	u.id = 3;

-- INNER JOIN IMPLICITA	
-- mostrar los videos del usuario 'soso' por su id
SELECT 
	u.nombre as 'usuario',
    v.nombre as 'video',
    c.nombre as 'categoria'
FROM 
	usuario as u,
    video as v,
    categoria as c
   
WHERE
	u.id = v.usuario_id AND
    v.categoria_id = c.id;	
	
	