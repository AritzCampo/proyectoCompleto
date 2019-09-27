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
    
    
   /* subconsulta con group by para likes ANDER
    * ************************************************/
    
    
    
     SELECT id, nombre, 
 IFNULL( ( SELECT COUNT(*) as 'likes_videos' FROM likes GROUP BY video_id  HAVING video_id = id ) , 0 ) as likes FROM video ORDER BY likes DESC;
 
 

 SELECT * FROM video;
-- SELECT COUNT(*) as 'likes_videos' FROM likes GROUP BY video_id  HAVING video_id = 89

-- SELECT * FROM likes;
-- SELECT video_id, COUNT(*) as 'likes_videos' FROM likes GROUP BY video_id;

-- SELECT usuario_id , COUNT(*) as 'likes_usuario' FROM likes GROUP BY usuario_id;

 
  /* END subconsulta con group by para likes */
 
 -- GROUP BY EDER
 SELECT v.id, v.nombre, IFNULL ( COUNT(l.video_id), 0 ) 'likes'
	FROM video v, usuario u, likes l
	WHERE v.id = l.video_id AND u.id = l.usuario_id
    GROUP BY video_id ORDER BY likes DESC;

  -- GROUP BY EDER LARGA
    
SELECT v.id as 'video_id', v.nombre as 'video_nombre', codigo,
		u.id as 'usuario_id', u.nombre as 'usuario_nombre',
        c.id as 'categoria_id', c.nombre as 'categoria_nombre',
        IFNULL((SELECT COUNT(*) as 'likes_videos' FROM likes GROUP BY video_id  HAVING video_id = v.id),0) 'likes'
	FROM video as v, usuario as u , categoria as c
	WHERE v.usuario_id = u.id AND v.categoria_id = c.id 
	ORDER BY likes DESC LIMIT 500;
    
-- SELECT CATEGORÍAS CON SU TOTAL DE VÍDEOS.

	SELECT c.id 'codigo_video', c.nombre, COUNT(v.id) 'total_videos',
		(SELECT COUNT(ca.id)
			FROM categoria ca LEFT JOIN video vi ON ca.id = vi.categoria_id
				INNER JOIN likes l ON vi.id = l.video_id
                where ca.id = codigo_video) 'total_likes'
	FROM categoria c LEFT JOIN video v ON c.id = v.categoria_id
    GROUP BY c.id;
	
	