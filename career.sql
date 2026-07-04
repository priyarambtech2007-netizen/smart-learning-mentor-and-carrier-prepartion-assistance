-- career.sql
-- Sample database schema and seed data for career guidance, course recommendations, and learning resources.

CREATE TABLE IF NOT EXISTS careers (
  career_id INTEGER PRIMARY KEY AUTOINCREMENT,
  career_name TEXT NOT NULL,
  category TEXT NOT NULL,
  description TEXT NOT NULL,
  top_skills TEXT NOT NULL,
  growth_outlook TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS courses (
  course_id INTEGER PRIMARY KEY AUTOINCREMENT,
  course_name TEXT NOT NULL,
  career_id INTEGER NOT NULL,
  category TEXT NOT NULL,
  level TEXT NOT NULL,
  duration_weeks INTEGER NOT NULL,
  overview TEXT NOT NULL,
  FOREIGN KEY (career_id) REFERENCES careers(career_id)
);

CREATE TABLE IF NOT EXISTS resources (
  resource_id INTEGER PRIMARY KEY AUTOINCREMENT,
  course_id INTEGER NOT NULL,
  resource_type TEXT NOT NULL CHECK(resource_type IN ('book', 'video')),
  title TEXT NOT NULL,
  url TEXT,
  notes TEXT,
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE IF NOT EXISTS enrollments (
  enrollment_id INTEGER PRIMARY KEY AUTOINCREMENT,
  student_name TEXT NOT NULL,
  student_email TEXT NOT NULL,
  course_id INTEGER NOT NULL,
  enrolled_on TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'active',
  FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Sample career entries
INSERT INTO careers (career_name, category, description, top_skills, growth_outlook) VALUES
('AI/Software Developer', 'Technology', 'Design, build and deploy intelligent applications using programming, ML, and software engineering.', 'Python, Machine Learning, Algorithms, Software Design', 'Very strong demand across industry and startups.');
INSERT INTO careers (career_name, category, description, top_skills, growth_outlook) VALUES
('Web Developer', 'Technology', 'Create full-stack websites and web applications using modern frontend and backend tools.', 'HTML, CSS, JavaScript, Flask, React', 'High demand for interactive and data-driven web applications.');
INSERT INTO careers (career_name, category, description, top_skills, growth_outlook) VALUES
('Data Analyst', 'Data', 'Collect, clean, and visualize data to help teams make evidence-based decisions.', 'SQL, Python, Excel, Data Visualization', 'Strong demand in business, finance, healthcare, and research.');

-- Sample courses
INSERT INTO courses (course_name, career_id, category, level, duration_weeks, overview) VALUES
('AI Foundations', 1, 'AI & Machine Learning', 'Beginner', 10, 'Foundational course on Python, machine learning concepts, and basic model building.');
INSERT INTO courses (course_name, career_id, category, level, duration_weeks, overview) VALUES
('Web Development Bootcamp', 2, 'Web Development', 'Beginner', 12, 'Learn HTML, CSS, JavaScript, and Flask by building real projects.');
INSERT INTO courses (course_name, career_id, category, level, duration_weeks, overview) VALUES
('Data Analytics Essentials', 3, 'Data Analytics', 'Beginner', 8, 'Hands-on analytics training with Python, SQL, and visualization tools.');
INSERT INTO courses (course_name, career_id, category, level, duration_weeks, overview) VALUES
('Python Programming', 1, 'Programming', 'Beginner', 10, 'Master Python from basics to advanced concepts with real-world projects.');
INSERT INTO courses (course_name, career_id, category, level, duration_weeks, overview) VALUES
('Java Programming', 1, 'Programming', 'Beginner', 12, 'Learn Java OOP, Collections, and build scalable applications.');
INSERT INTO courses (course_name, career_id, category, level, duration_weeks, overview) VALUES
('HTML & CSS', 2, 'Web Development', 'Beginner', 6, 'Create beautiful, responsive websites with modern HTML5 and CSS3.');
INSERT INTO courses (course_name, career_id, category, level, duration_weeks, overview) VALUES
('JavaScript Essentials', 2, 'Web Development', 'Beginner', 8, 'Master JavaScript fundamentals and DOM manipulation for interactive web pages.');
INSERT INTO courses (course_name, career_id, category, level, duration_weeks, overview) VALUES
('React.js Mastery', 2, 'Web Development', 'Intermediate', 10, 'Build modern SPAs using React, Hooks, and state management.');
INSERT INTO courses (course_name, career_id, category, level, duration_weeks, overview) VALUES
('Node.js Backend', 2, 'Web Development', 'Intermediate', 10, 'Create backend APIs and services using Node.js and Express.');
INSERT INTO courses (course_name, career_id, category, level, duration_weeks, overview) VALUES
('AI & Machine Learning', 1, 'AI & Machine Learning', 'Intermediate', 14, 'Deep dive into ML algorithms, neural networks, and practical implementations.');
INSERT INTO courses (course_name, career_id, category, level, duration_weeks, overview) VALUES
('SQL Database Design', 3, 'Data Analytics', 'Beginner', 6, 'Learn SQL queries, database design, and optimization techniques.');
INSERT INTO courses (course_name, career_id, category, level, duration_weeks, overview) VALUES
('Advanced Excel', 3, 'Data Analytics', 'Beginner', 5, 'Master Excel for data analysis, pivot tables, and dashboards.');
INSERT INTO courses (course_name, career_id, category, level, duration_weeks, overview) VALUES
('Cloud Computing with AWS', 1, 'Cloud', 'Intermediate', 10, 'Deploy applications on AWS using EC2, S3, Lambda, and databases.');
INSERT INTO courses (course_name, career_id, category, level, duration_weeks, overview) VALUES
('Docker & Kubernetes', 1, 'DevOps', 'Intermediate', 8, 'Containerize applications and manage them with Docker and Kubernetes.');
INSERT INTO courses (course_name, career_id, category, level, duration_weeks, overview) VALUES
('Git & Version Control', 1, 'Development Tools', 'Beginner', 4, 'Master Git, GitHub, and collaborative development workflows.');

-- Sample resources for AI Foundations
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(1, 'book', 'Python Crash Course by Eric Matthes', 'https://nostarch.com/pythoncrashcourse2e', 'Good starter book for Python programming.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(1, 'book', 'Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow', 'https://www.oreilly.com/library/view/hands-on-machine-learning/9781492032632/', 'Covers practical machine learning workflows.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(1, 'book', 'Deep Learning with Python by François Chollet', 'https://www.manning.com/books/deep-learning-with-python', 'A practical introduction to deep learning with Keras.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(1, 'video', 'Machine Learning Basics - Andrew Ng', 'https://www.youtube.com/watch?v=GwIo3gDZCVQ', 'Introductory video for machine learning concepts.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(1, 'video', 'Python for Data Science Full Course', 'https://www.youtube.com/watch?v=rfscVS0vtbw', 'Step-by-step Python tutorial for data work.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(1, 'video', 'Intro to TensorFlow for Deep Learning', 'https://www.youtube.com/watch?v=tPYj3fFJGjk', 'Hands-on TensorFlow training for beginners.');

-- Sample resources for Web Development Bootcamp
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(2, 'book', 'Eloquent JavaScript by Marijn Haverbeke', 'https://eloquentjavascript.net/', 'Modern JavaScript reference for developers.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(2, 'book', 'HTML and CSS: Design and Build Websites', 'https://www.htmlandcssbook.com/', 'Beginner-friendly guide to web design.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(2, 'book', 'Learning Web Design by Jennifer Niederst Robbins', 'https://www.oreilly.com/library/view/learning-web-design/9781491960207/', 'A complete guide to HTML, CSS, and web layouts.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(2, 'video', 'The Web Developer Bootcamp', 'https://www.youtube.com/watch?v=Q33KBiDriJY', 'Comprehensive full-stack web course.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(2, 'video', 'Flask Tutorial - Python Web Development', 'https://www.youtube.com/watch?v=Z1RJmh_OqeA', 'Build backend applications with Flask.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(2, 'video', 'HTML Full Course - Build a Website Tutorial', 'https://www.youtube.com/watch?v=pQN-pnXPaVg', 'Beginner web development project with HTML and CSS.');

-- Sample resources for Data Analytics Essentials
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(3, 'book', 'Python for Data Analysis by Wes McKinney', 'https://www.oreilly.com/library/view/python-for-data/9781491957653/', 'Essential resource for pandas and data manipulation.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(3, 'book', 'Storytelling with Data', 'https://www.wiley.com/en-us/Storytelling+with+Data%3A+A+Data+Visualization+Guide+for+Business+Professionals-p-9781119002253', 'Learn visual communication for analytics.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(3, 'book', 'Practical Statistics for Data Scientists', 'https://www.oreilly.com/library/view/practical-statistics-for/9781492072938/', 'Statistics concepts for data work.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(3, 'video', 'Data Analysis with Python Course', 'https://www.youtube.com/watch?v=r-uOLxNrNk8', 'Practical Python data analysis lessons.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(3, 'video', 'SQL Tutorial - Full Course', 'https://www.youtube.com/watch?v=9Pzj7Aj25lw', 'Complete SQL training for analytics.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(3, 'video', 'Tableau Full Course for Beginners', 'https://www.youtube.com/watch?v=2r9DkCOJQP8', 'Data visualization and dashboard training.');

-- Sample resources for Python Programming
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(4, 'book', 'Automate the Boring Stuff with Python by Al Sweigart', 'https://automatetheboringstuff.com/', 'Practical Python scripting and automation projects.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(4, 'book', 'Effective Python by Brett Slatkin', 'https://effectivepython.com/', 'Best practices for writing cleaner Python code.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(4, 'video', 'Python Full Course - Beginner to Advanced', 'https://www.youtube.com/watch?v=rfscVS0vtbw', 'Comprehensive Python tutorial.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(4, 'video', 'Python OOP Tutorial', 'https://www.youtube.com/watch?v=JeznW_7DlB0', 'Object-oriented programming in Python.');

-- Sample resources for Java Programming
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(5, 'book', 'Head First Java', 'https://www.oreilly.com/library/view/head-first-java/9781491910771/', 'A beginner-friendly guide to Java programming.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(5, 'book', 'Effective Java by Joshua Bloch', 'https://www.oreilly.com/library/view/effective-java-3rd/9780134686097/', 'Java best practices and design patterns.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(5, 'video', 'Java Full Course for Beginners', 'https://www.youtube.com/watch?v=GoXwIVyNvX0', 'Complete Java programming course.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(5, 'video', 'Java OOP Tutorial', 'https://www.youtube.com/watch?v=TBWX97e1E9g', 'Object-oriented programming with Java.');

-- Sample resources for HTML & CSS
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(6, 'book', 'Learning Web Design by Jennifer Niederst Robbins', 'https://www.oreilly.com/library/view/learning-web-design/9781491960207/', 'Complete HTML and CSS guide.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(6, 'book', 'CSS Secrets by Lea Verou', 'https://www.oreilly.com/library/view/css-secrets/9781449372736/', 'Tips for writing better CSS layouts and effects.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(6, 'video', 'HTML Full Course - Build a Website Tutorial', 'https://www.youtube.com/watch?v=pQN-pnXPaVg', 'Step-by-step website design.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(6, 'video', 'CSS Crash Course', 'https://www.youtube.com/watch?v=yfoY53QXEnI', 'Foundational CSS styling tutorial.');

-- Sample resources for JavaScript Essentials
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(7, 'book', 'You Don’t Know JS Yet by Kyle Simpson', 'https://github.com/getify/You-Dont-Know-JS', 'Deep dive into JavaScript fundamentals.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(7, 'book', 'JavaScript: The Good Parts by Douglas Crockford', 'https://www.oreilly.com/library/view/javascript-the-good/9780596517748/', 'Classic guide to core JavaScript concepts.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(7, 'video', 'JavaScript Tutorial for Beginners', 'https://www.youtube.com/watch?v=PkZNo7MFNFg', 'Beginner-friendly JS course.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(7, 'video', 'JavaScript DOM Tutorial', 'https://www.youtube.com/watch?v=0ik6X4DJKCc', 'Interactive DOM manipulation examples.');

-- Sample resources for React.js Mastery
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(8, 'book', 'Learning React by Alex Banks and Eve Porcello', 'https://www.oreilly.com/library/view/learning-react-2nd/9781492051718/', 'Modern React fundamentals and hooks.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(8, 'book', 'The Road to React by Robin Wieruch', 'https://www.roadtoreact.com/', 'Hands-on React development with projects.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(8, 'video', 'React JS Crash Course', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 'Quick introduction to React components.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(8, 'video', 'React Hooks Tutorial', 'https://www.youtube.com/watch?v=f687hBjwFcM', 'Learn React hooks and state management.');

-- Sample resources for Node.js Backend
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(9, 'book', 'Node.js Design Patterns', 'https://www.oreilly.com/library/view/nodejs-design-patterns/9781839214110/', 'Best practices for Node.js architecture.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(9, 'book', 'Learning Node.js Development', 'https://www.packtpub.com/product/learning-nodejs-development/9781785884666', 'Build scalable Node apps.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(9, 'video', 'Node.js Full Course', 'https://www.youtube.com/watch?v=Oe421EPjeBE', 'Complete backend development course.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(9, 'video', 'Express.js Crash Course', 'https://www.youtube.com/watch?v=L72fhGm1tfE', 'Build APIs with Express.js.');

-- Sample resources for AI & Machine Learning
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(10, 'book', 'Pattern Recognition and Machine Learning', 'https://www.springer.com/gp/book/9780387310732', 'Advanced machine learning theory.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(10, 'book', 'Deep Learning by Ian Goodfellow, Yoshua Bengio, and Aaron Courville', 'https://www.deeplearningbook.org/', 'Comprehensive deep learning textbook.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(10, 'video', 'Deep Learning Full Course', 'https://www.youtube.com/watch?v=aircAruvnKk', 'Intro to deep learning concepts.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(10, 'video', 'Machine Learning with Python Full Course', 'https://www.youtube.com/watch?v=7eh4d6sabA0', 'End-to-end ML project training.');

-- Sample resources for SQL Database Design
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(11, 'book', 'SQL for Data Analytics', 'https://www.oreilly.com/library/view/sql-for-data/9781492088782/', 'Learn SQL queries for analytics.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(11, 'book', 'Learning SQL by Alan Beaulieu', 'https://www.oreilly.com/library/view/learning-sql-3rd/9781492057604/', 'SQL fundamentals with examples.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(11, 'video', 'SQL Full Course', 'https://www.youtube.com/watch?v=HXV3zeQKqGY', 'Comprehensive SQL basics and advanced topics.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(11, 'video', 'Database Design Course', 'https://www.youtube.com/watch?v=ztHopE5Wnpc', 'Relational database design explained.');

-- Sample resources for Advanced Excel
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(12, 'book', 'Excel Bible by John Walkenbach', 'https://www.wiley.com/en-us/Excel+Bible%2C+2021+Edition-p-9781119846124', 'Complete Excel reference.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(12, 'book', 'Microsoft Excel Data Analysis and Business Modeling', 'https://www.microsoftpressstore.com/store/microsoft-excel-data-analysis-and-business-modeling-9780735697798', 'Excel models for business and analysis.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(12, 'video', 'Excel Basics Course', 'https://www.youtube.com/watch?v=8Bv_exJYUfE', 'Excel fundamentals and formulas.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(12, 'video', 'Excel Pivot Table Tutorial', 'https://www.youtube.com/watch?v=9NUjHBNWe9M', 'Create powerful Excel reports.');

-- Sample resources for Cloud Computing with AWS
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(13, 'book', 'AWS Certified Solutions Architect Official Study Guide', 'https://www.wiley.com/en-us/AWS+Certified+Solutions+Architect+Official+Study+Guide-p-9781119504212', 'Key AWS services and exam topics.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(13, 'book', 'Learning AWS by Aurobindo Sarkar and Amit Shah', 'https://www.packtpub.com/product/learning-aws/9781789130680', 'Beginner-friendly AWS guide.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(13, 'video', 'AWS Certified Cloud Practitioner Course', 'https://www.youtube.com/watch?v=Ia-UEYYR44s', 'AWS intro and core services overview.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(13, 'video', 'AWS Lambda Tutorial', 'https://www.youtube.com/watch?v=eOBq__h2OS4', 'Serverless computing with AWS Lambda.');

-- Sample resources for Docker & Kubernetes
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(14, 'book', 'Docker Deep Dive by Nigel Poulton', 'https://www.nigelpoulton.com/docker-deep-dive/', 'Containerization with Docker.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(14, 'book', 'Kubernetes Up & Running', 'https://www.oreilly.com/library/view/kubernetes-up/9781492046523/', 'Production Kubernetes patterns.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(14, 'video', 'Docker Full Course', 'https://www.youtube.com/watch?v=3c-iBn73dDE', 'Docker container tutorial.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(14, 'video', 'Kubernetes Tutorial for Beginners', 'https://www.youtube.com/watch?v=X48VuDVv0do', 'Kubernetes deployment basics.');

-- Sample resources for Git & Version Control
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(15, 'book', 'Pro Git by Scott Chacon and Ben Straub', 'https://git-scm.com/book/en/v2', 'Comprehensive Git reference.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(15, 'book', 'Git Pocket Guide by Richard E. Silverman', 'https://www.oreilly.com/library/view/git-pocket-guide/9781449327507/', 'Quick Git command guide.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(15, 'video', 'Git and GitHub Crash Course', 'https://www.youtube.com/watch?v=RGOj5yH7evk', 'Git workflow and version control tutorial.');
INSERT INTO resources (course_id, resource_type, title, url, notes) VALUES
(15, 'video', 'Git Tutorial for Beginners', 'https://www.youtube.com/watch?v=HVsySz-h9r4', 'Get started with Git branching and commits.');

-- Sample enrollment record
INSERT INTO enrollments (student_name, student_email, course_id, enrolled_on, status) VALUES
('Amit Sharma', 'amit@example.com', 1, '2026-07-01', 'active');
