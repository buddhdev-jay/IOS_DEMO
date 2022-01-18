import UIKit
import Darwin
print("Hello World")
//Variables
//Boolean
var result:Bool = true
print(result)
//Integer
var highScore:Int = 50
print(highScore)
//Float
let highScore_float:Float = 3.1416
print(highScore_float)
//Double
let highScore_double:Double = 3.1416
print(highScore_double)
//Character
let playercharacter:Character = "J"
//String
let playerName = "Jay"
//Multiline String Literals
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.
"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""
//nil
//used for null
var serverResponseCode:String?
print(serverResponseCode)
var number : Int = 0
number += 5
print(number)
//There is one constant with value of interest rate (15%) create one playground for calculate interest for given amount and duration
let rate = 15.5
var amount = 10000
var time = 1
var SI = (rate * Double(amount) * Double(time)) / 100
print(SI)
//Operator:
//Create example for String concate using operators
let string1 = "hello"
let string2 = "there"
var welcome = string1 + string2
print(welcome)
//Create one example for show usage of operator's addition, multiplication, division for integers and floats
//Integer
var number1 = 50
var number2 = 100
print(number1+number2)
print(number1-number2)
print(number1*number2)
print(number1/number2)
//Float
var number3 = 50.78
var number4 = 100.52
print(number3+number4)
print(number3-number4)
print(number3*number4)
print(number3/number4)
//What is turnery operator and show example of usage?
let score = 88
let result1 = score > 85 ? "Pass" : "Fail"
//Working with Text
//Strings & Characters
// 1.Write a Swift program to create a new string made of a copy of the first two characters of a given string. If the given string is shorter than length 2, return whatever there is.
var string3 = "Simform"
var string4 : String?
if string3.count <= 2 {
    string4 = string3
}
else {
    let index1 = string3.index(string3.startIndex, offsetBy: 2)
    string4 = String(string3[..<index1])
}
print(string4)
//2.Write a Swift program to create a new string without the first and last character of a given string
if string3.count > 2 {
    var first_index = string3.index(string3.startIndex, offsetBy: 1)
    var last_index = string3.index(string3.endIndex, offsetBy: -2)
    var final_result=String(string3[first_index...last_index])
    print(final_result)
}
/*3.Write a Swift program that accept two strings and return their concatenation, except the first char of each string. The given strings length must be at least 1.*/
string4 = "Example"
string3.removeFirst()
string4?.removeFirst()
var newString = string3 + (string4 ?? "hello")
print(newString)
/*4.Write a Swift program to move the first two characters of a given string to the end. The given string length must be at least 2.*/
string3="swift"
if string3.count>2 {
    var index1 = string3.index(string3.startIndex, offsetBy: 2)
    var first_two = String(string3[..<index1])
    string3 = String(string3.dropFirst(2))
    string3 += first_two
    print(string3)
}
//5.Write a Swift program to test if a given string starts with
string3="Swift"
if string3.hasPrefix("Sw") {
    print("true")
}
else {
    print("false")
}
//6.Write a Swift program to create a new string made of the first and last n chars from a given string. The string length will be at least n.
var string5 = "Simform Solutions"
var start_string = String(string5.prefix(3))
var end_string = String(string5.suffix(3))
var string6 = start_string + end_string
print(string6)

//Array
//1.Write a Swift program to check whether the first element and the last element of a given array of integers are equal. The array length must be 1 or more.
var array1 = [1,2,3,1]
if array1.count > 1 {
    if array1[0] == array1[array1.count-1]{
        print("True")
    }
}
//2.Write a Swift program to create a new array with double the lenght of a given array of integers and its last element is the same as the given array. The given array will be length 1 or more. By default, a new integer array contains all 0's.
var array2 = Array(repeating:0 , count:array1.count * 2)
print (array2[0])
array2[array2.count-1] = array1[array1.count-1]
print(array2)
//3.Write a Swift program to create a new array, taking first two elements from a given array of integers. If the length of the given array is less than 2 use the single element of the given array
var two_number_array = [Int]()
if array1.count > 2 {
    two_number_array = Array(array1.prefix(2))
}
else {
    two_number_array = array1
}
print(two_number_array)
//4.Write a Swift program to take one array and find out maximum number from that array
var max_number = [0,50,100,20,80,150]
print(max_number.max())
//5.Write a Swift program to take one array and sort it in descending order.
var descending_order_array = [0,5,6,2,10]
print(descending_order_array.sorted(by:>))
//6.Print all the numbers from listOfNumbers that are divisible by at least one number from divisors
var listOfNumbers = [1, 2, 3, 10, 100]
var divisors = [2, 5]
var division_result_set = Set<Int>()
for number in listOfNumbers {
    for div in divisors {
        if number % div == 0 {
            division_result_set.insert(number)
        }
        
    }
}
print(division_result_set)
for num in division_result_set.sorted() {
    print(num)
}
//7.Try all Array methods: new
//1.Array.filter()
print(listOfNumbers.filter{ $0 < 5 })
//2.Array.Map()
var squarenumber = listOfNumbers.map{ $0 * $0}
//3.Array.sort()
squarenumber.sort()
//4.Array.shuffle()
squarenumber.shuffle()
//5.Contains
squarenumber.contains(4)
//6.Reverse
squarenumber.reverse()

//Control Flow:
//Loop
//1.Print the powers of 2 that are less than or equal to N
var n = 100
var i = 0
var power = 1
while power < n {
    power = power * 2
    if(power >= n) {
        break
    }
    print(power)
}
//2.Given an integer N draw a square of N x N asterisks
n = 3
for i in 0...n-1 {
    for j in 0...n-1 {
        print("*",terminator: " ")
    }
    print("\n")
}
//3.Given an integer N draw a triangle of asterisks. The triangle should have N lines, the i-th line should have i asterisks on it.
n = 4
for i in 1...n {
    for j in 1...n {
        if j <= i{
            print("*",terminator:" ")
        }
    }
    print("\n")
}
//4.Given an integer N draw a pyramid of asterisks. The pyramid should have N lines. On the i-th line there should be N-i spaces followed by i*2-1 asterisks
for index in 0...n {
    for i in index...n {
        print("",terminator: "")
    }
    for i in 0...index {
        print("*",terminator: "")
    }
    print()
}
//5.You are given a number. Print "prime" if the number is a prime and "not prime" otherwise.
n = 17
var flag = 0
for i in 2...n {
    if n % i == 0 {
        flag = 1
        break
    }
}
if flag == 0 {
    print("Number is Prime")
}
else {
    print("Number is not prime")
}
//Dictionaries:
//1.You are given a dictionary code of type [String:String] which has values for all lowercase letters. The codedictionary represents a way to encode a message. For example if code["a"] = "z" and code["b"] = "x" the encoded version if "ababa" will be "zxzxz". You are also given a encodedMessage which contains only lowercase letters and spaces. Use the codedictionary to decode the message and print it. Write a Swift program to decode the message and print final output string
var code = [
    "a" : "b",
    "b" : "c",
    "c" : "d",
    "d" : "e",
    "e" : "f",
    "f" : "g",
    "g" : "h",
    "h" : "i",
    "i" : "j",
    "j" : "k",
    "k" : "l",
    "l" : "m",
    "m" : "n",
    "n" : "o",
    "o" : "p",
    "p" : "q",
    "q" : "r",
    "r" : "s",
    "s" : "t",
    "t" : "u",
    "u" : "v",
    "v" : "w",
    "w" : "x",
    "x" : "y",
    "y" : "z",
    "z" : "a",
    " " : " "
]
var encodedMessage = "uijt nfttbhf jt ibse up sfbe"
for char in encodedMessage {
    for (key,value) in code {
        if value == String(char){
            print(key,terminator: "")
        }
    }
}
//2.You are given an array of dictionaries. Each dictionary in the array contains exactly 2 keys “firstName” and “lastName”. Create an array of strings called firstNames that contains only the values for “firstName” from each dictionary.
var people: [[ String:String ]] = [
    [
        "firstName": "Calvin",
        "lastName": "Newton"
    ],
    [
        "firstName": "Garry",
        "lastName": "Mckenzie"
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera"
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno"
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen"
    ]
]
var firstname = people.map{$0["firstName"]}
//var first = firstname.flatMap{$0.firstName}
print(firstname)
//3.You are given an array of dictionaries. Each dictionary in the array contains exactly 2 keys “firstName” and “lastName”. Create an array of strings called fullNames that contains the values for “firstName” and “lastName” from the dictionary separated by a space.
var lastname = people.map{$0["lastName"]}
var firstname_lastname =  zip(firstname,lastname).map{ ($0.0 ?? "nil") + " " + ($0.1 ?? "nil") }
print(firstname_lastname)
//4.You are given an array of dictionaries. Each dictionary in the array describes the score of a person. Find the person with the lowest score and print his full name.
var people3: [[ String:Any ]] = [
    [
        "firstName": "Calvin",
        "lastName": "Newton",
        "score": 13
    ],
    [
        "firstName": "Garry",
        "lastName": "Mckenzie",
        "score": 12
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera",
        "score": 10
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno",
        "score": 3
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen",
        "score": 16
    ]
]
var minpeople = people3.min { a, b in
    ( a["score"] as? Int ?? 0 ) < ( b["score"] as? Int ?? 0 )
}
print(minpeople)
//5.You are given an array of dictionaries. Each dictionary in the array describes the score of a person. Print the leaderboard in the following format:
var people1: [[ String:Any ]] = [
    [
        "firstName": "Calvin",
        "lastName": "Newton",
        "score": 13
    ],
    [
        "firstName": "Garry",
        "lastName": "Mckenzie",
        "score": 23
    ],
    [
        "firstName": "Leah",
        "lastName": "Rivera",
        "score": 10
    ],
    [
        "firstName": "Sonja",
        "lastName": "Moreno",
        "score": 3
    ],
    [
        "firstName": "Noel",
        "lastName": "Bowen",
        "score": 16
    ]
]
var people4 = people1.sorted { a, b  in
    ( a["score"] as? Int ?? 0 ) < ( b["score"] as? Int ?? 0 )
}
var score1 = people4.map{ $0["score"] }
for (firstname1, (lastname1, score12)) in zip(firstname,zip(lastname,score1)){
    print("\(firstname1) \(lastname1) \(score12)")
}
//6.You are given an array of integers. Find out the frequency of each one.The frequency of a number is the number of times it appears in the array.Print the numbers in ascending order followed by their frequency.
var numbers = [1, 2, 3, 2, 3, 5, 2, 1, 3, 4, 2, 2, 2]
var Dict = [Int: Int]()
for i in numbers {
    Dict[i] = (Dict[i] ?? 0) + 1
}
for (key,value) in Dict.sorted(by: <) {
    print("\(key) \(value) ")
}
//Optionals:
//Create an example of demonstrating How to declare optionals in swift?
var names: String?
//
names = "jay"
//What is force unwrapping in optionals show usage in example.
if names != nil {
    print(names)
} else {
    print("names has nil value")
}
//Create one example of show usage of optional binding and if-let
if let containsname = names {
    print("Conatins Names\(names)")
} else {
    print("names has nil value")
}
//Create one example using guard-let
var demoname : String?
func guardfunction() {
    guard let containsname = demoname  else {
        print("Conatins Names\(names)")
        return
    }
}
guardfunction()
//Create one example using nil colloison operator
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
//The Basics
//1. Breakfast
/*You are working on a smart-fridge. The smart-fridge knows how old the eggs and bacon in it are. You know that eggs.spoil after 3 weeks (21 days) and bacon after one week (7 days).
 Given baconAge and eggsAge(in days) determine if you can cook bacon and eggs or what ingredients you need to throw out.If you can cook bacon and eggs print you can cook bacon and eggs.If you need to throw out any ingredients for each one print a line with the text throw out <ingredient> (where <ingredient> is bacon or eggs) in any order.*/
var baconAge = 3
var eggsAge = 2
if baconAge > 7 && eggsAge > 21 {
    print("Throw Bacon and Eggs")
}else if baconAge > 7 {
    print("Throw Bacon")
}else if eggsAge > 21 {
    print("Throw Eggs")
}else {
    print("you can cook bacon and eggs")
}
/*2. Leap Year
 You are given a year, determine if it’s a leap year. A leap year is a year containing an extra day. It has 366 days instead of the normal 365 days. The extra day is added in February, which has 29 days instead of the normal 28 days. Leap years occur every 4 years. 2012 was a leap year and 2016 will also be a leap year.
 The above rule is valid except that every 100 years special rules apply. Years that are divisible by 100 are not leap years if they are not also divisible by 400. For example 1900 was not a leap year, but 2000 was. Print Leap year! or Not a leap year! depending on the case. */
var year = 2000
if year % 4 == 0 {
    print("Leap year! ")
} else if (year % 100 == 0) {
    print("Leap year! ")
} else if (year % 400 == 0) {
    print("Leap year! ")
} else {
    print("Not Leap year! ")
}
/*3. Hitpoints
 You are working on a videogame where the character has a certain number of hitpoints(HP) ranging from 0 to 100.
 100 represents full health 0 represents dead. You want to add regenerating health to the game using the following rules:
 HP always regenerates up to numbers of the form X0 (75 -> 80 , 32 -> 40 …)
 When HP is below 20 it regenerates up to 20 (13 -> 20, 5 -> 20, …)
 If the character has 0 HP then he doesn’t regenerate life (he’s dead)
 Given the current hp of the character stored in a variable hp print the hp the player will have after regenerating life.  */
var hp = 60
switch hp {
case 0:
    print("Player is Dead")
case 75:
    hp = 80
case 32:
    hp = 40
case _ where hp < 20 :
    hp = 20
default:
    (hp = hp)
}
print(hp)
/*4. Above average
 You are given three grades obtained by 3 students in a class stored in variables grade1, grade2, grade3 oftypeDouble.
 You are also given your grade in the class stored in a variable yourGrade of type Double.
 Print above average if your grade is greater than the class average or below average” otherwise.
 Note: the average of the class includes your grade.*/
var grade1 = 7.0
var grade2 = 9.0
var grade3 = 5.0
var yourGrade = 8.0
if yourGrade > ((grade1 + grade2 + grade3 + yourGrade) / 4) {
    print("above average" )
}else{
    print("below average" )
}
/*5.Tipping
 You have the cost of a meal at a restaurant stored in a variable mealCost of type Double.
 You would like to leave a tip of a certain percentage. The percentage is stored in a variable tip of type Int.
 Print the total cost of the meal.  */
var mealCost:Double = 3.5
var tip:Int = 20
var total_cost = mealCost + (mealCost * Double(tip)) / 100
print(total_cost)
