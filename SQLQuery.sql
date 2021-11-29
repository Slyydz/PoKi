--Number 1:  
select * from Grade
--Number 2: 
select * from Emotion
--Number 3: 
select * from Poem
--Number 4: 
select top 76 * from Author order by Author.Name
--Number 5:
select top 76 Author.Id, Author.Name, Grade.Name as 'Grade' from Author 
inner join Grade on Grade.Id = Author.GradeId
order by Author.Name
--Number 6:
select top 76 Author.Id, Author.Name, Grade.Name as 'Grade', Gender.Name as 'Gender' from Author 
inner join Grade on Grade.Id = Author.GradeId
inner join Gender on Gender.Id = Author.GenderId
order by Author.Name
--Number 7:
select SUM(WordCount) as 'Sum of all words' from Poem
--Number 8:
select Title from Poem
where CharCount = (select MIN(CharCount) from Poem); 
--Number 9: 
select COUNT(Author.Name) as 'Authors in 3rd grade' from Author
join Grade on Grade.Id = Author.GradeId
where Grade.Name = '3rd Grade'
--Number 10:
select COUNT(Author.Name) as 'Authors in 3rd grade' from Author
join Grade on Grade.Id = Author.GradeId
where Grade.Name = '1st Grade' 
OR Grade.Name = '2nd Grade'
OR Grade.Name = '3rd Grade'
--Number 11:
select COUNT(Poem.Id) as 'Poems by 4th graders' from Poem 
join Author on Author.Id = Poem.AuthorId
join Grade on Grade.Id = Author.GradeId
where Grade.Name = '4th Grade'
--Number 12: 
select COUNT(Poem.Id) 'Number of Poems', Grade.Name 'Grade' from Poem 
join Author on Author.Id = Poem.AuthorId
join Grade on Grade.Id = Author.GradeId
group by Grade.Name
--Number 13: 
select COUNT(Author.Id) 'Number of Authors', Grade.Name 'Grade' from Author
join Grade on Grade.Id = Author.GradeId
group by Grade.Name
--Number 14: 
select Title from Poem 
where WordCount = (select MAX(WordCount) from Poem)
--Number 15: Come Back to this one
select Author.Name, Poem.Title, Poem.AuthorId from Author 
join Poem on Poem.AuthorId = Author.Id
group by Author.Name, Poem.Title, Poem.AuthorId
having COUNT(Poem.AuthorId) = 1
--Number 16: 
select COUNT(Poem.Id) 'Sad Poems' from Poem
join PoemEmotion on Poem.Id = PoemEmotion.PoemId
join Emotion on PoemEmotion.EmotionId = Emotion.Id
where Emotion.Name = 'sadness'
--Number 17: 
select COUNT(Poem.Id) 'Poems without emotions' from Poem
left join PoemEmotion on Poem.Id = PoemEmotion.PoemId
left join Emotion on PoemEmotion.EmotionId = Emotion.Id
where Emotion.Name is NULL
--Number 18: Come back to this one
select COUNT(Poem.Id) 'Poems', Emotion.Name from Poem
left join PoemEmotion on Poem.Id = PoemEmotion.PoemId
left join Emotion on PoemEmotion.EmotionId = Emotion.Id
group by Emotion.Name
--Number 19: 
select COUNT(Poem.Id) 'Poems', Emotion.Name, Grade.Name from Poem
left join PoemEmotion on Poem.Id = PoemEmotion.PoemId
left join Emotion on PoemEmotion.EmotionId = Emotion.Id
left join Author on Author.Id = Poem. AuthorId
left join Grade on Grade.Id = Author.GradeId
where Emotion.Name = 'Joy'
group by Emotion.Name, Grade.Name
order by Grade.Name





