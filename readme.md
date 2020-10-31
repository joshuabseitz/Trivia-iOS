# Tandem Trivia for iOS 📱🕹
This is an iOS trivia app, built for Tandem's 2020 Apprentice Software Engineering code challenge. Documentation of this code challenge can be viewed [here](https://madeintandem.com/wp-content/uploads/2020/10/Tandem_Apprentice_Challenge_2020.zip).

## Key Features of Tandem Trivia for iOS
* 📇 Code parses JSON files to retrieve trivia data
* 📐 Code architected with MVC pattern
* 🎨 Custom designed UI, with classes built to support custom designs
* 💾 Uses CoreData to save and persist highscores from users

## Tandem Trivia in Action 🎬
Trivia Game | Saving Score
:--:|:--:
<img src="/demo/questions.gif" width="220" height="480"/> | <img src="/demo/savescore.gif" width="220" height="480"/>

## Assumptions
* Round of triva has 10 questions
* All questions are multiple-choice questions
* Score does not need to update in realtime
* Results can update on form submit, button click, or any interaction you choose
* We will provide you with the triva data, such as the questions, correct and incorrect answers via a JSON file

## Acceptance Criteria
* User can view questions
* Questions with their multiple choice options must be displayed one at a time
* User can select only 1 anwser out of 4 possible answers
* Correct answer must be revealed after a suser has submitted their answer
* User can see the score they recieved at the end of the round

## Personal Challenges
* Explore a way to build this with TDD
* Is there a formal design pattern I could use to develop this project?
* How do I build this with the least amount of complexity (may be good time to brush up on Big O Notation...)
* What kind of documentation can I create to plan this project?
	 * Perhaps a more formal requirements document
	 * Perhaps a UML that will promote OO development
* What are the odds that I get this submitted to the the App Store ahead of the deadline? heh
* Use CoreData to score highscores!!!