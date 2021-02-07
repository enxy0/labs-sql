/* Удаляем книги от издательств Abatis Publishers и Деловой Мир*/
DELETE FROM [Книги-ру].dbo.книги
WHERE книги.ид_кни in (
        SELECT ид_кни
        FROM [Книги-ру].dbo.издательства
            INNER JOIN книги ON книги.издательство = издательства.ид_изд
        WHERE издательства.издательство in (
                'Abatis Publishers',
                'Деловой Мир'
            )
    )