% streams
stream('AI Engineer').
stream('Data Engineer').
stream('Network Engineer').
stream('Software Developer').

:- dynamic(interests_in/1).
:- dynamic(prerequisites_satisfied/1).

advice :-
  intro,
  retractall(prerequisites_satisfied(_)),
  retractall(interests_in(_)),
  retractall(research(_)),
  write('Let\'s find the suitable electives you should take based on your interests and background.'),nl,
  ask_interests(_),
   % ask_courses_done(_),
  ask_research,
  write('-----Courses you should enroll in based upon your responses-----'),sleep(0.25),nl,nl,
  final_advice(_,_,_).

intro :-
  write('\t\t\t\t  Electives Advisory/Prediction System'),sleep(0.25), nl, nl,
  write('Answer the following questions as accurately as possible.'),nl,
  write('To answer, input either \'y\' or \'n\' next to each question, followed by a dot (.)'), nl, nl.

/* ask_courses_done(_) :-
	stream(Interest),
  courses_done(Interest),
  assert(prerequisites_satisfied(Interest)),fail.

ask_courses_done(_) :- !. */

ask_interests(_) :-
  stream(Interest),
  interested(Interest),
  assert(prerequisites_satisfied(Interest)),
  fail.

ask_interests(_) :- !.

interested('AI Engineer') :-
  nl,
  write('Would you like to learn how to build Recommendation systems, robots, smart assistants and solve other similar problems?'),nl,
  read(A),A = y,
  assert(interests_in('AI')),
  courses_done('AI Engineer').

interested('Data Engineer') :-
  nl,
  write('Do you like to find hidden mysterious patterns in data?'),nl,
  read(B),B = y,
  assert(interests_in('DE')),
  courses_done('Data Engineer').

interested('Network Engineer') :-
  nl,
  write('Are you intriguied by how computers communicate so quickly to other computers miles away and want to explore this field?'),nl,
  read(C),C = y,
  assert(interests_in('NE')),
  courses_done('Network Engineer').

interested('Software Developer') :-
  nl,
  write('Would you like to know how websites, apps work behinnd the scenes?'),nl,
  read(D),D = y,
  assert(interests_in('SDE')),
  courses_done('Software Developer').


courses_done('AI Engineer') :-
	write('Are you interested in job roles related to '), write('AI Engineer'), write(':'),nl,
  read(A), A = y,
  write('Have you done any programming courses like python (or any object oriented programming language)?  '),nl,
  read(B), B = y,
  write('What is your GPA in that course?'),nl,
  read(C), C >= 7.

courses_done('Data Engineer') :-
  write('Are you interested in job roles related to '), write('Data Engineer'), write(':'),nl,
  read(A), A = y,
  write('Have you done any Probability and Statistics course?  '),nl,
  read(B), B = y,
  write('What is your GPA in that course?'),nl,
  read(C), C >= 7.

courses_done('Network Engineer') :-
  write('Are you interested in job roles related to '), write('Network Engineer'), write(':'),nl,
  read(A), A = y,
  write('Have you done any Computer Networks course?  '),nl,
  read(B), B = y,
  write('What is your GPA in that course?'),nl,
  read(C), C >= 7.

courses_done('Software Developer') :-
  write('Are you interested in job roles related to '), write('Software Developer'), write(':'),nl,
  read(A), A = y,
  write('Have you done any Website/mobile application development course?  '),nl,
  read(B), B = y,
  write('What is your GPA in that course?'),nl,
  read(C), C >= 7.

% Research
ask_research:- write('Have you done any Research work or published a research paper?'), nl, read(Y), nl, make_research(Y).
make_research(Y) :- Y = y, assert(research('True')).
make_research(Y) :- Y = n, assert(research('False')).


final_advice(PRE_VAL, INT_VAL, RES_VAL) :-
  prerequisites_satisfied(PRE_VAL), interests_in(INT_VAL), research(RES_VAL),
  PRE_VAL = 'AI Engineer',INT_VAL = 'AI', RES_VAL = 'True',
  write('Since you have interests in the field of Artificial Intelligence, and '),nl,
  write('You have also completed prerequisites therefore you should go for following intermediate to advance courses: '),nl,nl,
  write('1- Machine Learning'),nl,
  write('2- Deep Learning'),nl,
  write('3- Advance Machine Learning'),nl,
  write('4- Multi-Agent Systems'),nl,nl,
  write('Also since you have some research experience, you should strongly consider Thesis option.'),nl.

final_advice(PRE_VAL, INT_VAL, RES_VAL) :-
  prerequisites_satisfied(PRE_VAL), interests_in(INT_VAL), research(RES_VAL),
  PRE_VAL = 'AI Engineer',INT_VAL = 'AI',
  write('Since you have interests in the field of Artificial Intelligence, and '),nl,
  write('You have also completed prerequisites therefore you should go for following intermediate to advance courses: '),nl,nl,
  write('1- Machine Learning'),nl,
  write('2- Deep Learning'),nl,
  write('3- Advance Machine Learning'),nl,
  write('4- Multi-Agent Systems'),nl,
  write('Since you don\'t have any research experience, you should go for Scholarly paper or CapStone Project.'),nl.

final_advice(PRE_VAL, INT_VAL, RES_VAL) :-
  prerequisites_satisfied(PRE_VAL), interests_in(INT_VAL), research(RES_VAL),
  PRE_VAL = 'Data Engineer',INT_VAL = 'DE', RES_VAL = 'True',
  write('Since you have interests in the field of Data Science, and '),nl,
  write('You have also completed prerequisites therefore you should go for following intermediate to advance courses: '),nl,nl,
  write('1- Database Management System'),nl,
  write('2- Data Mining'),nl,
  write('3- Big Data Analytics'),nl,
  write('4- Distributed Data Mining'),nl,
  write('Also since you have some research experience, you should strongly consider Thesis option.'),nl.

final_advice(PRE_VAL, INT_VAL, RES_VAL) :-
  prerequisites_satisfied(PRE_VAL), interests_in(INT_VAL), research(RES_VAL),
  PRE_VAL = 'Data Engineer',INT_VAL = 'DE',
  write('Since you have interests in the field of Data Science, and '),nl,
  write('You have also completed prerequisites therefore you should go for following intermediate to advance courses: '),nl,nl,
  write('1- Database Management System'),nl,
  write('2- Data Mining'),nl,
  write('3- Big Data Analytics'),nl,
  write('4- Distributed Data Mining'),nl,
  write('Since you don\'t have any research experience, you should go for Scholarly paper or CapStone Project.'),nl.

final_advice(PRE_VAL, INT_VAL, RES_VAL) :-
  prerequisites_satisfied(PRE_VAL), interests_in(INT_VAL), research(RES_VAL),
  PRE_VAL = 'Network Engineer',INT_VAL = 'NE', RES_VAL = 'True',
  write('Since you have interests in the field of Computer Networks, and '),nl,
  write('You have also completed prerequisites therefore you should go for following intermediate to advance courses: '),nl,nl,
  write('1- Foundations to Computer Security'),nl,
  write('2- Security Engineering'),nl,
  write('3- Secure Coding'),nl,
  write('4- Theory of Modern Cryptography'),nl,
  write('Also since you have some research experience, you should strongly consider Thesis option.'),nl.

final_advice(PRE_VAL, INT_VAL, RES_VAL) :-
  prerequisites_satisfied(PRE_VAL), interests_in(INT_VAL), research(RES_VAL),
  PRE_VAL = 'Network Engineer',INT_VAL = 'NE',
  write('Since you have interests in the field of Computer Networks, and '),nl,
  write('You have also completed prerequisites therefore you should go for following intermediate to advance courses: '),nl,nl,
  write('1- Foundations to Computer Security'),nl,
  write('2- Security Engineering'),nl,
  write('3- Secure Coding'),nl,
  write('4- Theory of Modern Cryptography'),nl,
  write('Since you don\'t have any research experience, you should go for Scholarly paper or CapStone Project.'),nl.

final_advice(PRE_VAL, INT_VAL, RES_VAL) :-
  prerequisites_satisfied(PRE_VAL), interests_in(INT_VAL), research(RES_VAL),
  PRE_VAL = 'Software Developer',INT_VAL = 'SDE', RES_VAL = 'True',
  write('Since you have interests in the field of software development, and '),nl,
  write('You have also completed prerequisites therefore you should go for following intermediate to advance courses: '),nl,nl,
  write('1- Data Structures and Algorithms'),nl,
  write('2- Mobile Computing'),nl,
  write('3- Web Technologies'),nl,
  write('4- Database Management Systems'),nl,
  write('Also since you have some research experience, you should strongly consider Thesis option.'),nl.

final_advice(PRE_VAL, INT_VAL, RES_VAL) :-
  prerequisites_satisfied(PRE_VAL), interests_in(INT_VAL), research(RES_VAL),
  PRE_VAL = 'Software Developer',INT_VAL = 'SDE',
  write('Since you have interests in the field of software development, and '),nl,
  write('You have also completed prerequisites therefore you should go for following intermediate to advance courses: '),nl,nl,
  write('1- Data Structures and Algorithms'),nl,
  write('2- Mobile Computing'),nl,
  write('3- Web Technologies'),nl,
  write('4- Database Management Systems'),nl,nl,
  write('Since you don\'t have any research experience, you should go for Scholarly paper or CapStone Project.'),nl.


final_advice(PRE_VAL, INT_VAL, RES_VAL) :-
  interests_in(INT_VAL),
  (INT_VAL = 'AI'; INT_VAL = 'DE' ; INT_VAL = 'NE' ; INT_VAL = 'SDE'),
  write('Although you have interests in some fields.'),nl,
  write('But you do  not satisfy the prerequisites to do an M.Tech. level course.'),nl,
  write('We suggest you take up some foundational courses and try again later.'),nl.

final_advice(PRE_VAL, INT_VAL, RES_VAL) :-
  write('Sorry, we can\'t suggest any courses for you.'),nl.
