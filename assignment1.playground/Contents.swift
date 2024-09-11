import UIKit

// Step 1
var firstName = "Danial";
var lastName = "Bidaibek";
var age = 20;
var birthYear = 2004;
var isStudent = true;
var heigh = 1.80;

var currentYear = Calendar.current.component(.year, from: Date());

var calculatedAge = currentYear - birthYear;

print(calculatedAge);

// Step 2
var hobby = "Table tennis";
var numberOfHoobbies = 2;
var favoriteNumber = 4;
var isHobbyCreative = false;

func getLifeStory() -> String {
    var fullNameText = "My name is " + firstName + " " + lastName + ". " ;
    var ageText = "I am \(calculatedAge) years old, born in \(birthYear). ";
    var isStudentText = "I am currently " + (isStudent ? "" : "not") + "a student. ";
    var hobbyText = "I enjoy \(hobby), which is \(isHobbyCreative ? "" : "not") a creative hobby. ";
    var numberOfHobbiesText = "I have \(numberOfHoobbies) hobbies in total. "
    var favoriteNumberText = "My favorite number is \(favoriteNumber). "
    var futureGoalText = "In the future, I want to become professional backend developer."
    
    return fullNameText + ageText + isStudentText + hobbyText + numberOfHobbiesText + favoriteNumberText + futureGoalText;
}

print(getLifeStory())
