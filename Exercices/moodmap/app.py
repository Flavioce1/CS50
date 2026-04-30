# MoodMap - CS50 final project
# I used Claude (AI) to help me build this project faster.
# The code is based on what we did in Week 9 and I understand every line.

from flask import Flask, render_template, request, redirect
from datetime import datetime
import sqlite3

app = Flask(__name__)

DB = "moodmap.db"


def get_db():
    conn = sqlite3.connect(DB)
    conn.row_factory = sqlite3.Row
    return conn


def init_db():
    conn = get_db()
    conn.execute("""
        CREATE TABLE IF NOT EXISTS entries (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            mood TEXT NOT NULL,
            note TEXT,
            day TEXT NOT NULL
        )
    """)
    conn.commit()
    conn.close()


@app.route("/")
def index():
    conn = get_db()
    entries = conn.execute("SELECT mood, note, day FROM entries ORDER BY id DESC").fetchall()

    happy = conn.execute("SELECT COUNT(*) FROM entries WHERE mood = 'good'").fetchone()[0]
    meh = conn.execute("SELECT COUNT(*) FROM entries WHERE mood = 'meh'").fetchone()[0]
    bad = conn.execute("SELECT COUNT(*) FROM entries WHERE mood = 'bad'").fetchone()[0]
    conn.close()

    return render_template("index.html", entries=entries, happy=happy, meh=meh, bad=bad)


@app.route("/add", methods=["POST"])
def add():
    mood = request.form.get("mood")
    note = request.form.get("note", "")

    if mood not in ("good", "meh", "bad"):
        return redirect("/")

    today = datetime.now().strftime("%Y-%m-%d")
    conn = get_db()
    conn.execute("INSERT INTO entries (mood, note, day) VALUES (?, ?, ?)", (mood, note, today))
    conn.commit()
    conn.close()
    return redirect("/")


if __name__ == "__main__":
    init_db()
    app.run(debug=True)
