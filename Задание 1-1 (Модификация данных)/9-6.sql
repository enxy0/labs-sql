INSERT INTO [Книги-ру].dbo.издательства (
        ид_изд,
        издательство,
        город,
        регион,
        страна
    )
SELECT pub_id,
    pub_name,
    city,
    state,
    country
FROM [Книги-ру].dbo.new_publishers
WHERE country <> 'USA';