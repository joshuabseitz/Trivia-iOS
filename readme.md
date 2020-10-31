# Tandem Trivia for iOS 📱🕹
This is a trivia app for iOS build for a Tandem code challenge. The app is built with [these assumptions and requirements](#tandem-trivia) in mind, in addition to features described [here](#key-features-of-tandem-trivia)

## How to Play Tandem Trivia ⚡
* Clone the project to XCode 12 with this link: https://github.com/joshuabseitz/trivia.git
* Select <b>iPhone 11 Pro Max</b> as your simulator, for optimal experience
* Hit <b>cmd + r</b> and start answering questions!

## Key Features of Tandem Trivia
* 📇 Code parses JSON files to retrieve trivia data
* 📐 Code OO and architected with MVC pattern
* 🎨 Custom built UI, with classes built to support custom designs of existing UI elements
* 💾 Uses CoreData to save and persist highscores from users
* ⚙️ Unit tests ensure that code is working correctly

## Tandem Trivia in Action 🎬
Trivia Game | Saving Score
:--:|:--:
<img src="/demo/questions.gif" width="220" height="480"/> | <img src="/demo/savescore.gif" width="220" height="480"/>

# Tandem Trivia
This app was built for Tandem's (previously, DevMynd) Software Engineering Aprrentice application. Details for this code challenge can be found on [this slideshow](https://madeintandem.com/wp-content/uploads/2020/10/Tandem_Apprentice_Challenge_2020.zip).

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