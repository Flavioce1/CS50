# MoodMap

#### Video Demo: https://youtu.be/9ARobp89MNI

#### Description:

MoodMap is my final project for CS50. It's a small website where you can save your mood every day. You choose if the day was good, meh or bad and you can write a small note. Then you see all the days you saved and the count of each mood.

I am learning to code since 3 months so I wanted to do something simple that I really understand. I also used Claude (the AI) to help me build the project faster, but I read every line and I know what each part does. I put a mention of Claude in the comments of the code like CS50 says to do.

The reason I did this project is because at the end of the week I never know if globally my week was good or not. With MoodMap I just click one button and write one line, and after some weeks I can see if I had more good days or bad days.

## How to use it

You need Python 3 and Flask. To install Flask :

```
pip install flask
```

Then in the project folder you do :

```
python app.py
```

The first time, it creates the file moodmap.db all alone. Then you go on http://127.0.0.1:5000/ in your browser and you can use the app.

## The files

There is 3 main files :

`app.py` is the python file with Flask. There is only 2 routes inside. The first one is `/` and it shows the page with the form, the counts and the list of all entries. The second one is `/add` and it takes the form and put a new line in the database. There is also a small function init_db that creates the table the first time.

`templates/index.html` is the only HTML page. I use Jinja to show the data from python. There is a form on the top with the 3 mood buttons and the note, and after there is the counts and the list of entries.

`static/styles.css` is the css. I made it very simple with one blue color, a grey background for the form and white boxes for the entries. I didn't use Bootstrap because i wanted to do the css myself.

`schema.sql` was in my first version but I removed it because I do the CREATE TABLE directly in python now, it's easier for me.

## My choices

I had some choices to do during the project.

For the login, I thought to add a system like in finance (Week 9) with sessions and password, but in the end I didn't do it. The reason is that this app is just for me on my computer, so I don't really need accounts. Maybe later I will add it.

For the database I used sqlite3 from python (not the cs50 library). I did this because like that the project can run on every computer without installing the cs50 thing. I open and close the connection myself in each route. It's a bit more code but it's not hard.

For the mood I save it like text ("good", "meh", "bad"). At first I wanted to use numbers (0, 1, 2) but text is more easy to read when I open the database, and the SQL query `WHERE mood = 'good'` is more clear.

For the date I save it with `datetime.now().strftime("%Y-%m-%d")`. I only keep the day not the time because for one mood per day it's enough.

## What is not perfect

I know my project is not perfect. There is some things I would like to do better but I don't know how yet :

- You can not delete an entry if you make a mistake
- There is no graph, just numbers and a list
- The design is very simple

If I have time later I will try to add these things. Maybe also a search bar to find old notes.

## Conclusion

It's not a big project but I made it from start to finish and I understand every line. CS50 was hard for me, especially the C weeks at the begin, but I'm happy I finished. Thanks to David Malan and the team for the course.
