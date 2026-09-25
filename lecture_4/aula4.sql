SELECT "id" 
FROM "authors"
WHERE "name" = 'Fernanda Melchor';

SELECT "book_id"
FROM "authored" 
WHERE "author_id" = (
    SELECT "id"
    FROM "authors"
    WHERE "name" = 'Fernanda Melchor'
);

SELECT "title"
FROM "books"
WHERE "id" IN (
    SELECT "book_id"
    FROM "authored" 
    WHERE "author_id" = (
        SELECT "id"
        FROM "authors"
        WHERE "name" = 'Fernanda Melchor'
    )
);
-----------------------------------------

SELECT "name", "title"
FROM "authors"
JOIN "authored" ON "authors.id" = "authored.author_id"
JOIN "books" ON "books.id" = "authored.book_id";

CREATE VIEW "longlist" AS
SELECT "name", "title"
FROM "authors"
JOIN "authored" ON "authors.id" = "authored.author_id"
JOIN "books" ON "books.id" = "authored.book_id";

SELECT * FROM longlist;
+-------------------------+--------------------------------------------+
|          name           |                   title                    |
+-------------------------+--------------------------------------------+
| Eva Baltasar            | Boulder                                    |
| Cheon Myeong-Kwan       | Whale                                      |
| Maryse Condé            | The Gospel According to the New World      |
| Gauz                    | Standing Heavy                             |
| Georgi Gospodinov       | Time Shelter                               |
| Vigdis Hjorth           | Is Mother Dead                             |
| Andrey Kurkov           | Jimi Hendrix Live in Lviv                  |
| Laurent Mauvignier      | The Birthday Party                         |
| Clemens Meyer           | While We Were Dreaming                     |
| Perumal Murugan         | Pyre                                       |
| Guadalupe Nettel        | Still Born                                 |
| Amanda Svensson         | A System So Magnificent It Is Blinding     |
| Zou Jingzhi             | Ninth Building                             |
| Fernanda Melchor        | Paradais                                   |
| Mieko Kawakami          | Heaven                                     |
| Sang Young Park         | Love in the Big City                       |
| Norman Erikson Pasaribu | Happy Stories, Mostly                      |
| Claudia Piñeiro         | Elena Knows                                |
| Violaine Huisman        | The Book of Mother                         |
| David Grossman          | More Than I Love My Life                   |
| Paulo Scott             | Phenotypes                                 |
| Jon Fosse               | A New Name: Septology VI-VII               |
| Jonas Eika              | After the Sun                              |
| Geentanjali Shree       | Tomb of Sand                               |
| Olga Tokarczuk          | The Books of Jacob                         |
| Bora Chung              | Cursed Bunny                               |
| Éric Vuillard           | The War of the Poor                        |
| Benajamín Labatut       | When We Cease to Understand the World      |
| Andrzej Tichy           | Wretchedness                               |
| Judith Schalansky       | An Inventory of Losses                     |
| David Diop              | At Night All Blood is Black                |
| Can Xue                 | I Live in the Slums                        |
| Maria Stepanova         | In Memory of Memory                        |
| Adania Shibli           | Minor Detail                               |
| Jaap Robben             | Summer Brother                             |
| Mariana Enríquez        | The Dangers of Smoking in Bed              |
| Olga Ravn               | The Employees                              |
| Nana Ekvtimishvili      | The Pear Field                             |
| Ngũgĩ wa Thiong'o       | The Perfect Nine                           |
| Gabriela Cabezón Cámara | The Adventures of China Iron               |
| Marieke Lucas Rijneveld | The Discomfort of Evening                  |
| Nino Haratischvili      | The Eighth Life                            |
| Shokoofeh Azar          | The Enlightenment of The Greengage Tree    |
| Yōko Ogawa              | The Memory Police                          |
| Jon Fosse               | The Other Name: Septology I-II             |
| Daniel Kehlmann         | Tyll                                       |
| Emmanuelle Pagano       | Faces on the Tip of My Tongue              |
| Fernanda Melchor        | Hurricane Season                           |
| Samanta Schweblin       | Little Eyes                                |
| Enrique Vila-Matas      | Mac and His Problem                        |
| Willem Anker            | Red Dog                                    |
| Michel Houellebecq      | Serotonin                                  |
| Hwang Sok-yong          | At Dusk                                    |
| Jokha Alharthi          | Celestial Bodies                           |
| Olga Tokarczuk          | Drive Your Plow Over the Bones of the Dead |
| Hubert Mingarelli       | Four Soldiers                              |
| Mazen Maarouf           | Jokes for the Gunmen                       |
| Can Xue                 | Love in the New Millennium                 |
| Samanta Schweblin       | Mouthful of Birds                          |
| Tommy Wieringa          | The Death of Murat Idrissi                 |
| Sara Stridsberg         | The Faculty of Dreams                      |
| Marion Poschmann        | The Pine Islands                           |
| Alia Trabucco Zerán     | The Remainder                              |
| Juan Gabriel Vásquez    | The Shape of the Ruins                     |
| Annie Ernaux            | The Years                                  |
| Ahmed Saadawi           | Frankenstein in Baghdad                    |
| Jenny Erpenbeck         | Go, Went, Gone                             |
| Antonio Muñoz Molina    | Like a Fading Shadow                       |
| Laurent Binet           | The 7th Function of Language               |
| Gabriela Ybarra         | The Dinner Guest                           |
| Christoph Ransmayr      | The Flying Mountain                        |
| Javier Cercas           | The Impostor                               |
| Wu Ming-Yi              | The Stolen Bicycle                         |
| Han Kang                | The White Book                             |
| László Krasznahorkai    | The World Goes On                          |
| Virginie Despentes      | Vernon Subutex 1                           |
| Ariana Harwicz          | Die, My Love                               |
| Olga Tokarczuk          | Flights                                    |
+-------------------------+--------------------------------------------+

