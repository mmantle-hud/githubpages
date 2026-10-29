# CIS7203 Assignment 2: Database Driven Web Application Report

- [CIS7203 Assignment 2: Database Driven Web Application Report](#cis7203-assignment-2-database-driven-web-application-report)
  - [General Information](#general-information)
  - [Arrangements for the Return of Work and Feedback](#arrangements-for-the-return-of-work-and-feedback)
  - [Assignment Specific Resources](#assignment-specific-resources)
  - [Guidance on AI Usage](#guidance-on-ai-usage)
  - [General Study Guidance](#general-study-guidance)
  - [Exceptional Circumstances](#exceptional-circumstances)
  - [Extensions/Late Submission](#extensionslate-submission)
  - [Support and Guidance](#support-and-guidance)
  - [Regulations](#regulations)
  - [Assessment Tasks](#assessment-tasks)
    - [Database Driven Web Application](#database-driven-web-application)
    - [Development Report (2000 Words)](#development-report-2000-words)
      - [The word count](#the-word-count)
  - [Assessment Criteria and Grade Indicators](#assessment-criteria-and-grade-indicators)
    - [Assessment Criteria](#assessment-criteria)
    - [Grade Indicators](#grade-indicators)


## General Information

|                          |                                      |
| :----------------------- | :----------------------------------- |
| Module Code              | CIS7203                              |
| Module Title             | Relational Databases and Web Integration             |
| Module Leader            | Matthew Mantle                       |
| Module Tutors            | Matthew Mantle|
| Assessment Type          | Written Assignment                            |
| Academic Year             | 2026/2027                            |
| Term                     | 1                                    |
| Main or Resit            | Main                                 |
| Assessment Weighting     | 50%                                  |
| Group/Individual         | Individual                           |
| Word Count/Duration      | 2000 words     |
| Module Learning Outcomes | 2, 4, 5 and 6                            |

## Arrangements for the Return of Work and Feedback

|                   |                    |
| :---------------- | :----------------- |
| Submission Date   | Monday 7th December 2026 |
| Feedback Date     | Monday 28th January 2027 |
| Submission Time   | 12:00         |
| Submission Method | Upload a .pdf or Word document to Coursera: **Submission Point for Assessment 2: Database Driven Web Application Report**         |

## Assignment Specific Resources

|          |                                                                                             |
| :------- | :------------------------------------------------------------------------------------------ |
| Software | Coursera Lab Environment |
| Equipment | N/A|

## Guidance on AI Usage
**Level 2 - Some use Permitted**

Some use of AI tools is permitted in this assignment e.g. use of Copilot in VS Code, but you must ensure that the work you submit is your own and you fully understand the work you have submitted. 

## General Study Guidance
- Cite all information used in your work which is clearly from a source. Try to ensure that all sources in your reference list are seen as citations in your work, and all names cited in the work appear in your reference list. 
- Reference and cite your work in accordance with the APA 7th system - the University's chosen referencing style.  For specific advice, you can talk to your subject librarians or go to the library help desk, or you can access library guidance via the following link: APA 7th Referencing Guide.
- The University has regulations relating to Academic misconduct, including plagiarism. The Academic Skills Team can advise and help you with how to avoid 'poor scholarship' and potential academic misconduct.  
- If you have any concerns about your writing, referencing, research or presentation skills, you are welcome to consult the Academic Skills Team, you can book tutorial appointments with them via the website How to book a tutorial appointment
- Further study resources including the Academic Skills Team overview can be found here: Study resources
- Do not exceed the word limit/time/other limit. 

## Exceptional Circumstances
If you wish to make an EC claim against this module, you can access details on the procedure for claiming ECs, on the Registry website - **https://www.hud.ac.uk/registry/current-students/taughtstudents/considerationofpersonalcircumstances/**.

## Extensions/Late Submission
If you wish to submit an extension on this module, you can access details on the procedure for submitting extensions here - **https://students.hud.ac.uk/studies/registry/extensions/extensionsfortaughtstudents/**.

## Support and Guidance
General help, support and guidance information for your course and time at University can be found at **https://students.hud.ac.uk/help/** or you can speak to your module leader or Personal Academic Tutor for School based support.

## Regulations
The regulations governing assessments can be found here: **https://www.hud.ac.uk/policies/registry/awards-taught/section-5/**

## Assessment Tasks

You are required to develop a database-driven Flask web application, and then produce a report that describes the development you have undertaken. 

You do not need to submit the web application. You only need to submit the report. 

### Database Driven Web Application
The web application you develop should be based on the 'My Movie Diary' example we looked at in Module 4 of the course. 

There is an Lab on Coursera that contains the My Movie Diary database and some basic Flask files. This has been set-up for you. You should develop your application within this Coursera Lab environment. 

> You can use your own local development. However, you must use the exact same technologies i.e. Flask and PostgreSQL, and the same database. You can download the relevant SQL files from the Coursera Lab environment. 

There is also an ERD on Coursera that shows the database structure for the assignment database.  

The Flask application you develop should meet the following basic requirements:
- Your web application should allow users of the website to browse movies. A list of movies from the `movies` table should be presented to the user. Clicking on a movie should take the user to a page showing additional details for the selected movie e.g. the duration of the movie, year of release etc.
- There should be a separate 'dashboard' page for administrators of the site. This page should show summary statistics for the site. For example, the number of movies in the database, the user that's viewed the highest number of movies. 
- The web application must be styled using CSS. 
- The application must be easy to use and provide suitable navigation. This is not about complex use of CSS, instead basic good practices should be adopted e.g. colour contrast, readability, clear navigation, feedback to the user etc.
- Consideration should be given to the quality of the code e.g. correctly structured HTML, removing duplication in the Python code.

Completing the above requirements to a high standard will result in approximately a **C grade**. For higher grades, your app will need to demonstrate more ambitious, complex functionality and/or complex queries. Here are some examples.

- Make effective use of SQL joins to display detailed, complete information when a movie is selected e.g. the genres, the reviews for the movie, an image for the movie.
- Using a range of `SELECT` queries on the dashboard page to show understanding of key SQL concepts such as subqueries and outer joins. This part of the site is for administrators to monitor and understand activity within the web application. Try to think of interesting, relevant data that the owners of My Movie Diary might want to view e.g. users that haven't watched a movie in the last year. 
- Instead of simply listing all the movies, provide a search facility. For example, users could enter the title of a movie, matching movies would be displayed and the user could click on one of these to get the full details. 
- More ambitious use of CSS.

Some of these additional requirements require you to undertake some additional independent research. For example, we haven't covered how to insert images dynamically in Flask, and we haven't considered how to build a search facility using Flask. My advice is to leave these to last and only attempt them if you have time. You can still obtain a high score for the assignment without attempting these aspects.   

If you want to, you can add some additional pages e.g. an 'about' page. This will make the site feel more like a real site for the users. However, be wary of spending a lot of time on this. Focus on the key tasks described above. 

**You should not implement additional functionality** such as a login system, or allowing users to add movies to the site or submit reviews. Your web application should stick to the key requirements described above and only read data from the database not insert, update or delete records. 

On the dashboard page, you do not have to cover every single type of query we have looked at in the course. Choose a small number of queries (no more than six) that show different aspects of SQL and provide useful information for the administrators of My Movie Diary. 

There should be no use of any other technologies e.g. JavaScript.


### Development Report (2000 Words)
This should document the development you have undertaken.

You can write the report using Word, Markdown or any suitable technology. The final report should be submitted as a .pdf or Word file. 

Content requirements:
- The report should clearly describe the features you have implemented. This should be supported by appropriate evidence, including screenshots of the completed application and code samples. 
- The purpose of the report is to show understanding of web development topics (HTML, CSS, Flask) and relational databases and SQL. The report should not simply describe what has been implemented; you also need to provide analysis for the choices you have made. For example, if an outer join has been used for a dashboard query, the report should present the relevant SQL, show the resulting output in the application, and explain why an outer join was appropriate and what it achieves. If you have structured your Flask code to improve maintainability, you would present the Python code samples, and explain the advantages of the coding approach you have taken. 

Basic presentation requirements:
- Include a title page.
- Include a table of contents.
- Use a clear, readable and consistent font and font size.
- Organise the report into clearly numbered sections and subsections, using appropriate headings.
- Ensure that figures and tables are numbered, captioned and referred to within the text.
- Follow a consistent and professional format throughout.
- Do not write in the first person. 
- Do not include huge chunks of code. Use small, focused code samples that support the discussion e.g. a single view function or SQL query. 
- Screenshots should be used selectively to provide evidence of the completed application and should be readable at the size presented in the report.

#### The word count
- You must stay within 10% of the word count i.e. no more than 2200 words. 
- Code samples do not contribute towards the word count. 
- The word count for the document should be clearly presented at the end of the document. 


## Assessment Criteria and Grade Indicators

### Assessment Criteria

| Assessment Component | Marks | What is being assessed |
| :-------------------- | :----: | :--------------------- |
| **Application Functionality** | **20** | Successful implementation of the required application functionality, including browsing and viewing movie details and an administrator dashboard. Appropriate scope and ambition of additional functionality within the requirements of the assignment. Overall usability and effectiveness of the completed application. |
| **Database and SQL** | **25** | Effective use of SQL to retrieve and suitable data. Correct and appropriate use of queries, including joins, aggregate functions and other relevant SQL techniques. Complexity, variety and usefulness of queries developed for the application and administrator dashboard. |
| **Web Development and Code Quality** | **15** | Appropriate use of Flask, HTML and CSS. Structure and organisation of the application; quality and maintainability of Python and HTML code; appropriate avoidance of unnecessary duplication; effective styling, navigation and application of basic web usability principles. |
| **Analysis and Justification** | **20** | Clear explanation and analysis of the development undertaken. Appropriate justification of technical decisions and demonstration of understanding of SQL, relational databases and web development concepts. Effective use of focused code examples, SQL queries, screenshots and other evidence to support the discussion. |
| **Presentation and Communication** | **20** | Clear and professional communication of the development undertaken; organisation and readability of the report; effective integration and legibility of screenshots, code samples, figures and tables; appropriate use of sections, headings, captions and numbering; adherence to the specified presentation requirements. |
| **Total** | **100** | |


### Grade Indicators

|                   |                    |            |
| :---------------- | :----------------- |:-----------|
| 80 and above      |**Outstanding work (A+)** Demonstrating comprehensive mastery knowledge, understanding and extensive critical appreciation of the subject area.| Goes beyond an A grade to create a truly outstanding piece of work. The web application shows a depth of understanding, and mastery of chosen technologies. The report excels in all the requirements. |
| 70-79	|**Excellent work (A)** Demonstrating mastery of knowledge, understanding and critical appreciation of the subject area	| There may be minor areas for improvement. However, the web application meets all the requirements, and these have been implemented to a high standard. The report neatly, accurately and clearly describes the implementation. There is detailed analysis showing clear understanding of both SQL and web development.   |
|60-69	|**Very good work (B)** Demonstrating very good knowledge, understanding and appreciation of the subject area| Same as an A grade but with areas for improvement. For example, the scope and ambition are limited.|
|50-59	|**Good work (C)** Demonstrating good knowledge, understanding and appreciation of the subject area.|The web application successfully meets the basic requirements. However, complexity of the final app is limited. The report effectively describes the development and provides suitable analysis.  |
|40-49	|**Satisfactory work (D)** Demonstrating sufficient knowledge, understanding and appreciation of the subject area.|Successfully implements some key requirements in the web application. The report competently documents the development. |
|30-39	|**Unsatisfactory work (E)** Demonstrating very limited knowledge or understanding of the subject area|Fails to meet the basic requirements.|
|0-29	|**Poor / very poor work (F)** Demonstrating inadequate, limited knowledge and fragmentary understanding of the subject area.| Fails to meet the basic requirements.




