select * from bookstore;

select title, auth from bookstore lateral view explode(xml_query("AUTHORS/author", authors)) authtab as auth; 
