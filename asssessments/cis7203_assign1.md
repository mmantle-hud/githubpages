# CIS7203 Relational Databases and Web Integration - Assignment 1 Brief

- [CIS7203 Relational Databases and Web Integration - Assignment 1 Brief](#cis7203-relational-databases-and-web-integration---assignment-1-brief)
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
    - [The Scenario](#the-scenario)
    - [The Database Design Report (1200 Words)](#the-database-design-report-1200-words)
      - [The word count](#the-word-count)
  - [Marking Criteria](#marking-criteria)


## General Information

|                          |                                      |
| :----------------------- | :----------------------------------- |
| Module Code              | CIS7203                              |
| Module Title             | Relational Databases and Web Integration             |
| Module Leader            | Matthew Mantle                       |
| Module Tutors            | Matthew Mantle|
| Assessment Type          | Written Assignment                            |
| Acadmic Year             | 2026/2027                            |
| Term                     | 1                                    |
| Main or Resit            | Main                                 |
| Assessment Weighting     | 30%                                  |
| Group/Individual         | Individual                           |
| Word Count/Duration      | 1200 words     |
| Module Learning Outcomes | 1 and 4                            |

## Arrangements for the Return of Work and Feedback

|                   |                    |
| :---------------- | :----------------- |
| Submission Date   | Friday 30th October 2026 |
| Feedback Date     | Friday 20th November 2026 |
| Submission Time   | 12:00 Noon         |
| Submission Method | Upload a .pdf or Word doc to to Coursera to **Submission Point for Assessment 1: The Database Design Report**  |

## Assignment Specific Resources

|          |                                                                                             |
| :------- | :------------------------------------------------------------------------------------------ |
| Software | Word processor, a tool for creating ERDs (advice has been provided on Coursera under Module 4) |
| Equipment | N/A|

## Guidance on AI Usage

**Level 1 - Not Permitted**

If the use of AI is suspected, learners may be required to attend an interview with course tutors to demonstrate their understanding of the work they have submitted.

## General Study Guidance

- Cite all information used in your work which is clearly from a source. Try to ensure that all sources in your reference list are seen as citations in your work, and all names cited in the work appear in your reference list. 
- Reference and cite your work in accordance with the APA 7th system - the University's chosen referencing style.  For specific advice, you can talk to your subject librarians or go to the library help desk, or you can access library guidance via the following link: APA 7th Referencing Guide.
- The University has regulations relating to Academic misconduct, including plagiarism. The Academic Skills Team can advise and help you with how to avoid 'poor scholarship' and potential academic misconduct.  
- If you have any concerns about your writing, referencing, research or presentation skills, you are welcome to consult the Academic Skills Team, you can book tutorial appointments with them via the website How to book a tutorial appointment
- Further study resources including the Academic Skills Team overview can be found here: Study resources
- Do not exceed the word limit/time/other limit. 

## Exceptional Circumstances

If you wish to make an EC claim against this module, you can access details on the procedure for claiming ECs, on the Registry website - [**https://www.hud.ac.uk/registry/current-students/taughtstudents/considerationofpersonalcircumstances/**](https://www.hud.ac.uk/registry/current-students/taughtstudents/considerationofpersonalcircumstances/).

## Extensions/Late Submission

If you wish to submit an extension on this module, you can access details on the procedure for submitting extensions here - [**https://students.hud.ac.uk/studies/registry/extensions/extensionsfortaughtstudents/**](https://students.hud.ac.uk/studies/registry/extensions/extensionsfortaughtstudents/).

## Support and Guidance

General help, support and guidance information for your course and time at University can be found at [**https://students.hud.ac.uk/help/**](https://students.hud.ac.uk/help/) or you can speak to your module leader or Personal Academic Tutor for School based support.

## Regulations

The regulations governing assessments can be found here: [**https://www.hud.ac.uk/policies/registry/awards-taught/section-5/**](https://www.hud.ac.uk/policies/registry/awards-taught/section-5/)

## Assessment Tasks

You are required to produce a report demonstrating knowledge of database design using the relational model.

### The Scenario

A conservation charity runs a project to track cheetah populations in the Serengeti National Park. Researchers conduct surveys by driving off-road vehicles through the park where they record cheetah sightings, track prey movements, and map threats from competitor species such as lions and hyenas. 

You have been asked to design a relational database system that will effectively record survey results and support conservation analysis.

Here are the key requirements:- 
- The Serengeti park is split into different sectors e.g. Ndutu & Plains, Central Serengeti. Each survey takes place in a specific sector of the park. 
- Researchers work together in teams when conducting surveys. Each survey has one or more researchers assigned to it. A researcher may participate in many surveys over time.
- A survey takes place on a specific date with its start and end times recorded.
- The researchers travel through the park using an off-road vehicle. Each vehicle has a name e.g. Land Rover 4B, a description, maximum number of passengers, and a registration number. Each survey uses a single vehicle. The same vehicle can be used in many different surveys. 
- When one of the key species (e.g. cheetahs, prey species) is observed, the time and GPS coordinates (latitude and longitude) of the sighting is recorded along with how many of the animals were seen. Optional notes can be added to a sighting e.g. about the behaviour of the animals or habitat they were observed in. 
- The charity are very concerned about the accuracy of the sightings. It is important that the specific scientific name for the observed animal is recorded e.g. Acinonyx jubatus, Eudorcas thomsonii. However, researchers often find it easier to work with common names e.g. cheetah, Thomson's gazelle. 


### The Database Design Report (1200 Words)

You are required to document your database design in a database design report. 

Content requirements:
- A Conceptual Model: A high-level entity-relationship diagram showing your proposed entities, attributes, and relationship cardinalities.
- A Logical Model: A normalised database design (up to 3NF) identifying all tables, columns, primary keys and foreign keys and relational data types. 
- A data dictionary for the logical model, documenting each table and column, including data types, key constraints, nullability and appropriate validation constraints.
- Each of the above should be accompanied by analysis. This should explain decisions made in your design and demonstrate your understanding of key relational database design concepts and best practices. 
- Based on the above description, you may assume some additional attributes that aren't explicitly mentioned. Any significant assumptions should be clearly stated and justified. However, don't be tempted to expand the scenario beyond the provided description. As rough guide, your initial conceptual model should feature no more than ten entities. 
- Although your proposed design should be normalised, you do **not** have to show the normlaisation process step by step. 

Basic presentation requirements:
- Diagrams should be presented using Crow's Foot Notation.
- Diagrams should be readable at the size presented in the report.
- The report should include a title page.
- The report should include a table of contents.
- The report should use a clear, readable and consistent font and font size.
- The report should organised into clearly numbered sections and subsections, using appropriate headings.
- Figures and tables should be numbered and captioned.

#### The word count

- You must stay within 10% of the word count i.e. no more than 1320 words. 
- The diagrams and data dictionary do not contribute towards the word count. 
- The word count for the document should be clearly presented at the end of the document. 

## Marking Criteria

|      Score        |  Grade             |  Description          |
| :---------------- | :----------------- |:-----------|
| 80 and above      |**Outstanding work (A+)** Demonstrating comprehensive mastery knowledge, understanding and extensive critical appreciation of the subject area.| The proposed design is exceptionally clear, accurate and well justified, addressing all requirements of the scenario. The conceptual model, logical model and data dictionary are comprehensive and internally consistent. Analysis demonstrates excellent understanding of relational modelling, keys, relationships, constraints and appropriate design decisions. Goes beyond the standard expected for an A grade through exceptional depth, precision and critical insight. |
| 70-79	|**Excellent work (A)** Demonstrating mastery of knowledge, understanding and critical appreciation of the subject area	| The proposed design comprehensively addresses the scenario requirements and is accurate, appropriate and clearly presented. The conceptual model, logical model and data dictionary are detailed and consistent, with only minor areas for improvement. Detailed analysis clearly explains and justifies design decisions and demonstrates strong understanding of relational database design principles.  |
|60-69	|**Very good work (B)** Demonstrating very good knowledge, understanding and appreciation of the subject area| The proposed design addresses the majority of the scenario requirements and is generally accurate and appropriate. The conceptual model, logical model and data dictionary are presented to a good standard, although there may be some omissions, inconsistencies or errors. Analysis provides good explanation of design decisions and demonstrates clear understanding of relevant relational database concepts.|
|50-59	|**Good work (C)** Demonstrating good knowledge, understanding and appreciation of the subject area.|The proposed design provides a generally appropriate solution but contains significant omissions, inconsistencies or design problems. The main entities and relationships are identified, although aspects of the conceptual model, logical model or data dictionary may require substantial improvement. Analysis demonstrates understanding of key concepts but may lack depth, accuracy or justification. |
|40-49	|**Satisfactory work (D)** Demonstrating sufficient knowledge, understanding and appreciation of the subject area.|The proposed design addresses some important requirements of the scenario but is incomplete and/or contains major weaknesses. Some appropriate entities, relationships, keys and attributes are identified, but there may be significant problems with modelling or constraints. Analysis demonstrates basic understanding but is limited in depth or application. |
|30-0	|**Unsatisfactory work (E)/(F)** Demonstrating very limited knowledge or understanding of the subject area|The proposed design fails to adequately address the scenario requirements and/or contains fundamental modelling problems. Key aspects of the conceptual model, logical model or data dictionary may be missing or substantially incorrect. There is insufficient evidence of understanding of fundamental relational database design concepts.|





