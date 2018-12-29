SELECT ta.artist_name, COUNT(*) tracks_purchased
FROM invoice_line
JOIN (
    SELECT track.track_id, artist.name artist_name
    FROM track
    JOIN album ON track.album_id = album.album_id
    JOIN artist ON album.artist_id = artist.artist_id
    ) ta ON invoice_line.track_id = ta.track_id
GROUP BY ta.artist_name
ORDER BY 2 DESC
LIMIT 10
