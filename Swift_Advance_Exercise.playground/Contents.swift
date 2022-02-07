import UIKit

//Class
//1.Create a swift program to demonstrate swift class. Which has two variables inside class body. Access (Set its values and get its value.) these variables by creating one instance of class.
class Demo {
    var name: String
    var no: Int
    init(name: String, no: Int) {
        self.name = name
        self.no = no
    }
}
var demoObject = Demo(name: "Jay", no: 123)
print(demoObject.name)
print(demoObject.no)
//2.Create a swift program to demonstrate usage of swift class for usage of multiple initializers. Create one initializer with two parameters your name and college and another initializer with your name and department. You can be able to access these properties using instance of class
class College {
    var name: String?
    var clgname: String?
    var department: String?
    init(name: String, clgname: String) {
        self.name = name
        self.clgname = clgname
    }
    init(name: String, department: String) {
        self.name = name
        self.department = clgname
    }
}
var clgOne = College(name: "abc", clgname: "MEFGI")
var clgTwo = College(name: "abc", department: "Computer")
print(clgOne.name)
print(clgOne.clgname)
print(clgTwo.name)
print(clgTwo.department)
//3.Create a swift class without initializers and access (write, read) its properties using instance of class.
class DemoTwo {
    var name : String?
    var no : Int?
}
var demotwoObject = DemoTwo()
demotwoObject.name = "ABC"
demotwoObject.no = 123
print(demotwoObject.name)
print(demotwoObject.no)
//4.Create a swift class which is having code to return square of given number and access this code using class instance.
class Square {
    var length = 0.0
    var area: Double {
        get {
            return Double(length * length)
        }
        set {
            self.length = newValue
        }
    }
}
var squareObject = Square()
squareObject.length = 10
print(squareObject.area)
//5.Create a swift class example to show use of swift inheritance. Your base class has some property access this property. In two different child classes and show its usage using the instances of both child classes.
class Shape {
    var area: Double = 0
}
class Rectangle: Shape {
    var length: Double
    var height: Double
    
    init(length:  Double , height: Double) {
        self.length = length
        self.height = height
    }
    func calculate()-> Double {
        area = Double(length * height)
        return area
    }
}
class Circle: Shape {
    var radius: Double
    
    init(radius:  Double ) {
        self.radius = radius
    }
    func calculate()-> Double {
        area = Double(3.14 * radius * radius)
        return area
    }
}
var recarea = Rectangle(length: 20, height: 30)
print(recarea.calculate())
var circlearea = Circle(radius: 20)
print(circlearea.calculate())
//6.Create a swift class example to show use of swift base class which have some implementation inside any method. Now demonstrate usage of overriding that method implementation.
class Cricket {
    func printname() {
        print("Inside Cricket Class")
    }
}

class Tennis: Cricket {
    override func printname() {
        print("Inside Tennis Class")
    }
}
let cricinstance = Cricket()
cricinstance.printname()
let tennisinstance = Tennis()
tennisinstance.printname()
//7.Create a swift class with an initializer in a manner that you can create this class using initializing value. And one function which takes int input and returns the power of class instance.
class Power {
    var value: Double
    init(value: Double) {
        self.value = value
    }
    func doPower(power: Double) -> Double {
        return pow(value, power)
    }
}
let instance = Power(value: 5)
let result = instance.doPower(power: 3)
print(result)
//8.Create a swift class example which has a parent class for vehicles, and child classes for two different vehicles e.g. (bike & car). You need to use common properties and method in the parent class and inside child class, there will be some different property which is not common.
class Vehicles {
    var seats: Int
    var name: String
    init(seats:  Int, name: String) {
        self.seats = seats
        self.name = name
    }
}
class Bike: Vehicles {
    var colour: String
    init(colour: String,seats: Int, name: String) {
        self.colour = colour
        super.init(seats: seats, name: name)
    }
}
class Car: Vehicles {
    var gear: Int
    init(gear:Int,seats: Int, name: String){
        self.gear = gear
        super.init(seats: seats, name: name)
    }
}
var carObject = Car(gear: 5, seats: 5, name: "ABC")
var bikeObject = Bike(colour: "Black", seats: 2, name: "XYZ")
//9.Create a person swift class with person name initializer and create one function to greet that person.
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
    func greet() {
        print("Hello \(name)")
    }
}
let person1 = Person(name: "Joe")
person1.greet()
/*10.Create a swift class with some property. And then set its value using initializer of class, then perform below actions.
 let example1 = Example()
 Example1.a = “Hello”
 let example2 = example1
 example2.a = “Hi”
 print(example1.a)
 print(example2.a)
 */
class Example {
    var a: String = " "
    init() {}
}
let example1 = Example()
example1.a = "Hello"
let example2 = example1
example2.a = "Hi"
print(example1.a)
print(example2.a)
// This is Happening because of Reference Count
//Structure
//1.Create one structure of type Work, which have some properties like work location, work hours and one string array of project names. And create a function inside structure which returns all project names for the person.
struct Work {
    var worklocation: String
    var workhour: Int
    var projectNames = Array<String>()
    func projectname() -> [String]{
        return projectNames
    }
}
var works = Work(worklocation: "Ahmedabad", workhour: 25, projectNames: ["abc","xyz","pqr"])
print(works.projectname())
//2.Create a structure example which demonstrates use of initializer in structures.
struct StructDemo {
    var name: String
    init() {
        name = "Hello"
    }
}
var strucdemo1 = StructDemo()
print(strucdemo1.name)
//3.Create a structure program which can be initialized with parameters and it also should be able to initialized without parameters.
struct Item {
    var name: String
    var cost: Int
    var quantity: Int
    var totalCost: Int = 0
    init(name: String,cost: Int,quantity: Int) {
        self.name = name
        self.cost = cost
        self.quantity = quantity
        self.totalCost = cost * quantity
    }
}
var item1 = Item(name: "abc", cost: 25, quantity: 5)
print(item1.totalCost)
//4.Create one structure which have initializer which takes array of int as input returns  two arrays one of all even numbers and another is all odd numbers.
struct ArrayBuffer {
    var input =	Array<Int>()
    var evennumber = Array<Int>()
    var oddnumber = Array<Int>()
    init(input:[Int]) {
        self.input = input
        for i in input {
            if i%2 == 0 {
                evennumber += [i]
            }else {
                oddnumber += [i]
            }
        }
        print("Evennumber are : \(evennumber)")
        print("oddnumber are : \(oddnumber)")
    }
}
var array1 = ArrayBuffer(input: [1, 3, 5, 6, 8, 10, 9, 7, 8, 12])
//5.Create one swift structure program for person that contains basic details like name, age, gender. Then create one array of person with all details. Print all details of that array.
struct People {
    var name: String
    var Gender: String
    var age: Int
    init(name: String,Gender: String,age: Int) {
        self.name = name
        self.Gender = Gender
        self.age = age
    }
}
var peoplestructone = People(name: "Abc", Gender: "Male", age: 23)
var peoplestructtwo = People(name: "xyz", Gender: "Male", age: 25)
var peopleArray = Array<People>()
peopleArray.append(peoplestructone)
peopleArray.append(peoplestructtwo)
for item in peopleArray {
    print("\(item.name) \(item.Gender) \(item.age)")
}
//6.Perform same example given in class question no 10 and check output using structure. Try to find difference between these two outputs and try to figure out the reason for that output.
struct Examplestruct {
    var a: String = " "
    init() {}
}
var examplestruct1 = Examplestruct()
examplestruct1.a = "Hello"
var examplestruct2 = example1
examplestruct2.a = "Hi"
print(examplestruct1.a)
print(examplestruct2.a)
//Enumerations
//1.Write swift program using enumerations to check week day from given number. Consider Monday as 1 and Sunday as 7. We can be able to get day name as string in short form (sun, mon,...) and same full name (Sunday, Monday...) by given number of the day.
enum Weekdays {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    var value: (String,String) {
        switch self {
        case .one:
            return ("Monday","Mon")
        case .two:
            return ("Tuesday","Tue")
        case .three:
            return ("Wendesday","Wen")
        case .four:
            return ("Thursday","Thu")
        case .five:
            return ("Friday","Fri")
        case .six:
            return ("Saturday","Sat")
        case .seven:
            return ("Sunday","Sun")
        }
    }
}
print(Weekdays.one.value)
//2.Create one enumeration program to return number of days in a month.
enum Month {
    case January
    case February
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case October
    case November
    case December
    
    var days: Int {
        switch self {
        case Month.January, Month.March, Month.May, Month.July, Month.August, Month.October, Month.December:
            return 31
        case Month.April, Month.June,Month.September, Month.November:
            return 30
        case Month.February:
            return 28
        }
    }
}
print(Month.January.days)
//3.Write a swift program using enumerations to demonstrate Int enums.
//5.Write a swift program for enum with raw values.
enum Planets: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}
print(Planets.earth.rawValue)
//4.Write a swift program to demonstrate string type enum.
//8.Create an enum with its rawValues of type String and show usage of case to print value of case.
enum CarBrand: String {
    case Mercedes = "Known for luxury and iconic design. Definitely my fav!"
    case Toyota = "Known for high-quality, high-value cars"
    case Volkswagen = "This is the people's car"
    case Ford = "Known for crisp handling, absorbent ride, and solid feel"
    case Honda = "Known for their well-built, reliable cars"
}
print(CarBrand.Honda.rawValue)
print(CarBrand.Honda)
//5.Write a swift program using enumerations to get all cases as an array with use of CaseIterable(Optional) and without use of CaseIterable(Mandatory).
enum Drinks: CaseIterable {
    case Coffee,Tea,MintWater,Juices
}
var Drink = Drinks.allCases.map({ "\($0)" })
print(Drink)
//7.Write a swift program using enumerations for learn and demonsrate enum cases with parameters (Enum with associated values).
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let talking = Activity.talking(topic: "Science")
print(talking)
//Properties  Subscripts Methods & Inheritance
//1.Create an example using swift to demonstrate use of get only properties. Create a class with a property which value cannot be set outside of class.
class DemoPrivate {
    private(set) var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
var demo = DemoPrivate(name: "abc", age: 21)
demo.age = 24
print("\(demo.name),\(demo.age)")
//2.Create a swift program to demonstrate usage of computed properties using getter and setter.
class Circleone {
    var radius: Double
    var area: Double {
        get {
            return 3.14 * radius * radius
        }
        set(newValue) {
            radius = sqrt(newValue/3.14)
        }
    }
    init(radius: Double) {
        self.radius = radius
    }
}
var circle = Circleone(radius: 100)
print("Area of circle is \(circle.area)")
//3. Create a swift program to show usage of stored properties.
class Personone {
    var name: String = "Anonymous"
    var age: Int = 20
    init() {
    }
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
var person = Personone()
person.name = "Jay"
person.age = 23
print(person.name + " " + person.age.description)
//4.Create a swift program which has private properties which cannot directly be accessed. Means we cannot directly read or write it.
class Privateproperties {
    private var number = 0
    init(number: Int) {
        self.number = number
    }
    func getnumber()->Int {
        return number
    }
}
var privateobject = Privateproperties(number: 50)
privateobject.getnumber()
//6.Create one example of usage of willSet and didSet.
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
//7.Create one lazy stored property in a class and show usage of it.
class DataImporter {
    var filename = "data.txt"
}
class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
}
let manager = DataManager()
print(manager.importer.filename)
//8.Create one class as Base type Person which has common properties like name, occupation, etc. Create two child classes from the person which are Student, Employee and this two-child classes must have base properties and some other properties also. Example, student have college, but Employee have company. And demonstrate the usage of inheritance.
class Personthree {
    var name: String
    var Occupation: String
    init(name: String,Occupation: String) {
        self.name = name
        self.Occupation = Occupation
    }
}
class Student: Personthree {
    var college: String
    init(name: String, Occupation: String,college: String) {
        self.college = college
        super.init(name: name, Occupation: Occupation)
        
    }
}
class Employee: Personthree {
    var company: String
    init(name: String, Occupation: String,company: String) {
        self.company = company
        super.init(name: name, Occupation: Occupation)
    }
}
//9.Create one structure to show usage of mutating function in swift.
struct MutatingStruct {
    var name: String
    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}
var personname = MutatingStruct(name: "Jay")
personname.makeAnonymous()
//10.Create one class inheritance demo to show usage of method overriding.
class Vehicle {
    func displayInfo() {
        print("Four Wheeler or Two Wheeler")
    }
}
class Carone: Vehicle {
    override func displayInfo() {
        print("Four Wheeler")
    }
}
var carOne =  Carone()
carOne.displayInfo()
//11.Create one swift class to show usage of type methods.
public class Numbers {
    static func findMinimum(number1: Int, number2: Int) -> Int {
        var minimum: Int = number2
        if number1 < number2 {
            minimum = number1
        }
        return minimum
    }
}
var min = Numbers.findMinimum(number1: 3, number2: 5)
print(min)
//12.Create one swift class which is having class method and static method. Then in one child class try to override that methods and check the output/ error. (you will learn difference between class and static)
class ClassTypeMethodTest {
    static func typeMethodWithStatic() -> Int {
        return 7
    }
    class func typeMethodWithClass() -> String {
        return "twentyseven"
    }
}
class BSubclass: ClassTypeMethodTest {
    override class func typeMethodWithClass() -> String {
        return "seven"
    }
    /*override static func typeMethodWithStatic() -> Int {
     return 27
     }*/
    //Cannot Override method with static keyword
}
print(BSubclass.typeMethodWithClass())
//13.Create one example of subscript using array. Create one array of weekdays and one subscript func which takes int as argument and returns day of week.
class Arrayofweek {
    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday",
                        "Thursday", "Friday", "saturday"]
    subscript(index: Int) -> String {
        get {
            if index > days.count || index < 0 {
                return "Invalid"
            }
            else{
                return days[index]
            }
        }
    }
}
var p = Arrayofweek()
print(p[5])
//14.Create a swift program to show usage of subscript in string. I pass int argument and it returns the character at given position.
class Characterreturn {
    var name: String
    init(name: String) {
        self.name = name
    }
    subscript(offset: Int)-> Character {
        get{
            return name[name.index(name.startIndex, offsetBy: offset)]
        }
    }
}
var nameone = Characterreturn(name: "abc")
print(nameone[2])
//15.Create one swift subscript program which takes range as input and returns the string between the ranges.
class StringReturn {
    var name: String
    init(name: String) {
        self.name = name
    }
    subscript(startoffset: Int,endoffset: Int)-> String {
        get{
            let start = name.index(name.startIndex, offsetBy: startoffset)
            let end = name.index(name.startIndex, offsetBy: endoffset)
            return String(name[start..<end])
        }
    }
}
var stringObject = StringReturn(name: "Hello Simform")
print(stringObject[1,5])
//16. I have one integer array and create one function which takes range as input and returns all elements between the range.
class ArrayInteger {
    var numbers: [Int]
    init(numbers: [Int]) {
        self.numbers = numbers
    }
    subscript(startoffset: Int,endoffset: Int)-> [Int] {
        get{
            return Array(numbers[startoffset..<endoffset])
        }
    }
}
var intarray = ArrayInteger(numbers: [1,2,3,4,5,6,7,8,10,12,36])
print(intarray[1,5])
//17.I have one key value pair array. Create one function using subscript which takes key as input and returns it’s value.
class KeyArray {
    var names: [(id:Int, name:String)]
    init(names: [(id:Int, name:String)] ) {
        self.names = names
    }
    subscript(index: Int)-> String {
        get{
            let value = names.first{ $0.id == index}?.name ?? ""
            return value
        }
    }
}
var keyarrayone = KeyArray(names: [(1, "Hello"), (2, "Hi..")])
print(keyarrayone[1])
//18.Create one array of type Person and create one subscript function which takes person name as input and returns person info like name, age, birthdate etc.
class TypePerson {
    var name: String
    var age: Int
    var birthdate: Int
    init(name: String,age: Int,birthdate: Int) {
        self.name = name
        self.age = age
        self.birthdate = birthdate
    }
    subscript (input: String)-> (String,Int,Int) {
        get{
            if input == name {
                return (name,age,birthdate)
            }else {
                return ("No Name",0,0)
            }
        }
    }
}
var type = TypePerson(name: "Jay", age: 21, birthdate: 222)
var typeTwo = TypePerson(name: "abc", age: 22, birthdate: 333)
var typeperson = Array<TypePerson>()
typeperson.append(type)
typeperson.append(typeTwo)
print("\(typeTwo["Jay"])")
//19.Create one base class of type Song and create subclasses of music types (Hip-Hop, classical) and show usage of inheritance. // Here Music class have property singer, composer
//20.Create a swift class with properties which can be read-write outside of class.
class Music {
    var singer: String
    var composer: String
    init(singer: String, composer: String) {
        self.singer = singer
        self.composer = composer
    }
}
class HipHop: Music {
    var people: Int
    init(singer: String, composer: String,people: Int) {
        self.people = people
        super.init(singer: singer, composer: composer)
    }
}
class Classical: Music {
    var song: String
    init(singer: String, composer: String,song: String) {
        self.song = song
        super.init(singer: singer, composer: composer)
    }
}
var hiphopObject = HipHop(singer: "abc", composer: "XYZ", people: 5)
var classicalObject = Classical(singer: "PQR", composer: "IJK", song: "DEF")
print(classicalObject.song)
classicalObject.song = "abc"
print(classicalObject.song)
//Error Handling
//1.Create a password validation program. If length of password is less than 8 characters, it throws “Password too short” exception and if password is empty, throw “Empty password” exception.
enum PasswordError: Error {
    case Passwordtooshort
    case Emptypassword
    var value: String {
        switch self {
        case .Passwordtooshort:
            return "Password too short"
        case .Emptypassword:
            return "Empty Password"
        }
    }
}
var password: String? = nil
do {
    if password == nil {
        throw PasswordError.Emptypassword
    }else if password?.count ?? 0 < 8 {
        throw PasswordError.Passwordtooshort
    }
}
catch PasswordError.Emptypassword {
    print(PasswordError.Emptypassword.value)
}
catch PasswordError.Passwordtooshort {
    print(PasswordError.Passwordtooshort.value)
}
//2.Create a program for shopping cart. If desired quantity for an item is not available, throw exception.
enum ShoppingcartError: Error{
    case OutofStock
}
var item = 10
do {
    if item < 0 {
        throw ShoppingcartError.OutofStock
    }
}
catch ShoppingcartError.OutofStock {
    print("Out of Stock")
}
//Extensions
/*Create following string manipulation functions using string extensions:
 Add a character in a string at 5th position
 Replace one character with other in a string
 Remove white spaces from string
 Get number of words in a string*/
extension String {
    func addcharacter (str: inout String,char: Character) {
        str.insert(char, at: str.index(str.startIndex,offsetBy: 5))
    }
    func replacechar(str: inout String,ofchar: Character,withchar: Character){
     str = str.replacingOccurrences(of: String(ofchar), with: String(withchar))
     }
    func whitespace(str: String) -> String {
        return str.replacingOccurrences(of: " ", with: "")
    }
    func wordcount(str: String)->Int {
        return str.split(separator: " ").count
    }
}
var str1 = "Hello"
str1.addcharacter(str: &str1, char: "a")
print(str1)
print(str1.replacechar(str: &str1, ofchar: "H", withchar:"h"))
print(str1)
str1 = "    Hello  Simform  "
print(str1.whitespace(str: str1))
print(str1.wordcount(str:str1))
