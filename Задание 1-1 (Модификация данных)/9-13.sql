UPDATE книги
SET издательство = (
        SELECT ид_изд
        FROM [Книги-ру].dbo.издательства
        WHERE издательство = 'Abatis Publishers'
    )
WHERE книги.издательство in (
        SELECT книги.издательство
        FROM [Книги-ру].dbo.издательства
            INNER JOIN книги ON книги.издательство = издательства.ид_изд
        WHERE издательства.издательство = 'Schadenfreude Press'
    )