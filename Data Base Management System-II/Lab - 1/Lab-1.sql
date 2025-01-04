CREATE DATABASE CSE_4A_239

--Part – A

--1. Retrieve a unique genre of songs.
	SELECT DISTINCT GENRE
	FROM SONGS

--2. Find top 2 albums released before 2010.
	SELECT TOP 2 *
	FROM ALBUMS
	WHERE RELEASE_YEAR < 2010

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005)
	INSERT INTO SONGS VALUES
	(1245,'Zaroor', 2.55, 'Feel good', 1005)

	SELECT * FROM SONGS

--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’
	UPDATE SONGS 
	SET GENRE = 'Happy'
	WHERE SONG_TITLE = 'Zaroor'

--5. Delete an Artist ‘Ed Sheeran’
	DELETE 
	FROM ARTISTS
	WHERE ARTIST_NAME = 'Ed Sheeran'

--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)]
	ALTER TABLE SONGS
	ADD Ratings decimal(3,2)

	SELECT * FROM SONGS

--7. Retrieve songs whose title starts with 'S'.
	SELECT SONG_TITLE 
	FROM SONGS
	WHERE SONG_TITLE LIKE 'S%'

--8. Retrieve all songs whose title contains 'Everybody'.
	SELECT * 
	FROM SONGS
	WHERE SONG_TITLE LIKE '%EVERYBODY%'

--9. Display Artist Name in Uppercase.
	SELECT UPPER(ARTIST_NAME) 
	FROM ARTISTS

--10. Find the Square Root of the Duration of a Song ‘Good Luck’
	SELECT SQRT(DURATION)
	FROM SONGS
	WHERE SONG_TITLE = 'GOOD LUCK'

--11. Find Current Date.
	SELECT GETDATE() as [Current_Date]

--12. Find the number of albums for each artist.
	SELECT COUNT(AL.ALBUM_ID) AS NUMBER_OF_ALBUMS , 
		   AR.ARTIST_NAME
	FROM ALBUMS AL 
	INNER JOIN ARTISTS AR
	ON AL.ARTIST_ID = AR.ARTIST_ID
	GROUP BY AR.ARTIST_NAME

--13. Retrieve the Album_id which has more than 5 songs in it.
	SELECT ALBUM_ID 
	FROM SONGS
	GROUP BY ALBUM_ID
	HAVING COUNT(SONG_TITLE) > 5

--14. Retrieve all songs from the album 'Album1'. (using Subquery)
	SELECT *
	FROM SONGS
	WHERE ALBUM_ID = (SELECT ALBUM_ID
					  FROM ALBUMS
					  WHERE ALBUM_TITLE = 'Album1')

--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery)
	SELECT ALBUM_TITLE 
	FROM ALBUMS
	WHERE ARTIST_ID = (SELECT ARTIST_ID
					   FROM ARTISTS
					   WHERE ARTIST_NAME = 'Aparshakti Khurana')

--16. Retrieve all the song titles with its album title.
	SELECT S.SONG_TITLE ,
		   A.ALBUM_TITLE
	FROM SONGS S
	INNER JOIN ALBUMS A
	ON S.ALBUM_ID = A.ALBUM_ID

--17. Find all the songs which are released in 2020.
	SELECT S.SONG_TITLE ,
		   A.RELEASE_YEAR
	FROM SONGS S
	INNER JOIN ALBUMS A
	ON S.ALBUM_ID = A.ALBUM_ID
	WHERE A.RELEASE_YEAR = 2020

--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.
	CREATE VIEW Fav_Songs
	AS
	SELECT * FROM SONGS
	WHERE SONG_ID BETWEEN 101 AND 105

	SELECT * FROM FAV_SONGS

--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view.
	UPDATE Fav_Songs
	SET SONG_TITLE = 'Jannat'
	WHERE SONG_ID = 101

--20. Find all artists who have released an album in 2020.
	SELECT  AR.ARTIST_NAME ,
		   AL.RELEASE_YEAR
	FROM ALBUMS AL 
	INNER JOIN ARTISTS AR
	ON AL.ARTIST_ID = AR.ARTIST_ID
	WHERE AL.RELEASE_YEAR = 2020

--21. Retrieve all songs by Shreya Ghoshal and order them by duration.
	SELECT AR.ARTIST_NAME ,
		   S.SONG_TITLE
	FROM ARTISTS AR 
	INNER JOIN ALBUMS AL
	ON AR.ARTIST_ID = AL.ARTIST_ID

	INNER JOIN SONGS S 
	ON S.ALBUM_ID = AL.ALBUM_ID
	WHERE AR.ARTIST_NAME = 'Shreya Ghoshal'
	ORDER BY S.DURATION


--Part – B

--22. Retrieve all song titles by artists who have more than one album.
	SELECT S.Song_title, A.Album_title, AR.Artist_name
	FROM Songs S
	JOIN Albums A 
	ON S.Album_id = A.Album_id
	JOIN Artists AR ----------------------------------------------CHECK
	ON A.Artist_id = AR.Artist_id
	WHERE A.Artist_id IN (
		SELECT Artist_id
		FROM Albums
		GROUP BY Artist_id
		HAVING COUNT(Album_id) > 1
	)

--23. Retrieve all albums along with the total number of songs.
	SELECT AL.ALBUM_TITLE,COUNT(S.SONG_ID) AS NUM_OF_SONG
	FROM ALBUMS AL
	JOIN SONGS S
	ON AL.ALBUM_ID = S.ALBUM_ID
	GROUP BY AL.ALBUM_TITLE

--24. Retrieve all songs and release year and sort them by release year.
	SELECT S.SONG_TITLE,AL.RELEASE_YEAR
	FROM ALBUMS AL
	JOIN SONGS S
	ON AL.ALBUM_ID = S.ALBUM_ID
	ORDER BY AL.RELEASE_YEAR

--25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs.
	SELECT COUNT(SONG_ID) AS NUM_OF_SONGS,GENRE
	FROM SONGS
	GROUP BY GENRE
	HAVING COUNT(SONG_ID) > 2

--26. List all artists who have albums that contain more than 3 songs.
	SELECT AR.Artist_id, AR.Artist_name,COUNT(S.Song_id) AS Total_Songs
	FROM Artists AR
	JOIN Albums AL 
	ON AR.Artist_id = AL.Artist_id--------------------CHECK
	JOIN Songs S 
	ON AL.Album_id = S.Album_id
	GROUP BY AR.Artist_id, AR.Artist_name
	HAVING COUNT(S.Song_id) > 3;


--Part – C

--27. Retrieve albums that have been released in the same year as 'Album4'.
	SELECT Album_id, Album_title, Artist_id, Release_year
	FROM Albums
	WHERE Release_year = ( SELECT Release_year FROM Albums WHERE Album_title = 'Album4')
	AND Album_title != 'Album4'

--28. Find the longest song in each genre.
	SELECT S.Song_title, S.Genre, S.Duration
	FROM Songs S
	WHERE S.Duration = 
				(SELECT MAX(Duration) 
				FROM Songs
				WHERE Genre = S.Genre)
				
--29. Retrieve the titles of songs released in albums that contain the word 'Album' in the title.
	SELECT S.Song_title
	FROM Songs S
	JOIN Albums A 
	ON S.Album_id = A.Album_id
	WHERE A.Album_title LIKE '%Album%'

--30. Retrieve the total duration of songs by each artist where total duration exceeds 15 minute.
	SELECT AR.Artist_id, AR.Artist_name, SUM(S.Duration) AS Total_Duration FROM Artists AR
	JOIN Albums AL 
	ON AR.Artist_id = AL.Artist_id
	JOIN Songs S 
	ON AL.Album_id = S.Album_id
	GROUP BY AR.Artist_id, AR.Artist_name
	HAVING SUM(S.Duration) > 15