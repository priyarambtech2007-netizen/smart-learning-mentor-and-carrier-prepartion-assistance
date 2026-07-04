from flask import Flask, render_template, redirect, url_for
import sqlite3
import json

app = Flask(__name__)

DATABASE = 'database/career.db'

def get_db_connection():
    conn = sqlite3.connect(DATABASE)
    conn.row_factory = sqlite3.Row
    return conn

def get_courses_and_resources():
    conn = get_db_connection()
    cursor = conn.cursor()
    
    # Get all courses
    cursor.execute('SELECT course_id, course_name, category, level, duration_weeks, overview FROM courses')
    courses = cursor.fetchall()
    
    # Get all resources
    cursor.execute('SELECT course_id, resource_type, title, url FROM resources ORDER BY resource_id')
    resources = cursor.fetchall()
    
    # Organize resources by course_id
    course_resources = {}
    for course in courses:
        course_id = course['course_id']
        course_resources[course_id] = {
            'course_id': course_id,
            'course_name': course['course_name'],
            'description': course['overview'],
            'books': [],
            'videos': []
        }
    
    # Add resources to their courses
    for resource in resources:
        course_id = resource['course_id']
        if course_id in course_resources:
            if resource['resource_type'] == 'book':
                course_resources[course_id]['books'].append({
                    'title': resource['title'],
                    'url': resource['url']
                })
            elif resource['resource_type'] == 'video':
                course_resources[course_id]['videos'].append({
                    'title': resource['title'],
                    'url': resource['url']
                })
    
    conn.close()
    return courses, course_resources

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/dashboard')
def dashboard():
    return render_template('dashboard.html')

@app.route('/reference')
def reference():
    courses, course_resources = get_courses_and_resources()
    return render_template('reference.html', courses=courses, course_resources=course_resources)

@app.route('/courses')
def courses_redirect():
    return redirect(url_for('reference'))

@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/register')
def register():
    return render_template('register.html')

@app.route('/profile')
def profile():
    return render_template('profile.html')

@app.route('/progress')
def progress():
    return render_template('progress.html')

@app.route('/chatbot')
def chatbot():
    return render_template('chatbot.html')

@app.route('/mentor')
def mentor():
    return render_template('mentor.html')

@app.route('/mocktest')
def mocktest():
    return render_template('mocktest.html')

@app.route('/resume')
def resume():
    return render_template('resume.html')

if __name__ == '__main__':
    app.run(debug=True, port=5000)
