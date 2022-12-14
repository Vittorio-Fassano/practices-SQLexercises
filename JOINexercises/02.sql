SELECT testimonials.id AS id, testimonials."writerId" AS writer, testimonials."recipientId" AS recipient, 
testimonials.message AS messages 
FROM testimonials 
JOIN users AS t1 ON  testimonials."writerId" = users.id 
JOIN users AS t2 ON testimonials."recipientId" = users.id;