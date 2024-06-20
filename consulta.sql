SELECT p.nombre as 'Título', dd.tipoArchivo, d.fecha FROM Podcast.Detalles_descarga dd, Podcast.Descargas d, Podcast.Podcast p where p.idPodcast=d.Podcast_idPodcast and d.idDescargas=dd.descargas_idDescargas;

SELECT p.nombre as 'Título', dd.tipoArchivo, d.fecha, u.nombre
FROM Podcast.Detalles_descarga dd, Podcast.Descargas d, Podcast.Podcast p, Podcast.usuario u
WHERE p.idPodcast = d.Podcast_idPodcast and d.idDescargas = dd.descargas_idDescargas and u.idUsuario = d.Usuario_idUsuario;