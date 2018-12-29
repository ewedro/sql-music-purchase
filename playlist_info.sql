WITH playlist_db AS
    (
        SELECT 
            playlist.playlist_id playlist_id, 
            playlist.name playlist_name,
            track.name track_name,
            (track.milliseconds/1000) track_length
        FROM playlist
        LEFT JOIN playlist_track 
        ON playlist.playlist_id = playlist_track.playlist_id
        LEFT JOIN track
        ON playlist_track.track_id = track.track_id
        )
SELECT
    playlist_id,
    playlist_name,
    COUNT(track_name) number_of_tracks,
    SUM(track_length) length_seconds
FROM playlist_db
GROUP BY 1
ORDER BY 1 
