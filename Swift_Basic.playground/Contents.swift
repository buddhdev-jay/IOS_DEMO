import UIKit

var namestr : String = "Jay"
var nameint : Int = Int(namestr) ?? 1
print(nameint)
var anotherstr : String = "abc,Vishal,Jay,Purvesh"
var myname = "Jay"
var anotherstr2 = " "
if anotherstr.contains(myname) {
    if anotherstr.contains("\(myname)\(",")") {
        anotherstr2=anotherstr.replacingOccurrences(of: "\(myname)\(",")", with: "")
    }
    else if anotherstr.contains("\(",")\(myname)") {
        anotherstr2=anotherstr.replacingOccurrences(of: "\(",")\(myname)", with: "")
    }
    else{
        anotherstr2=anotherstr.replacingOccurrences(of: myname, with: "")
    }
}
print(anotherstr2)
enum days{
    case Monday
    case Tuesday
}
switch days.Monday {
case .Monday:
    print("Monday")
case .Tuesday:
    print("Tuesday")
}
//Commnets
// This is a single line comment.
/* This is a multi-line comment.
 /* This is the second line. */ */
//Print Statement
print("Items you want to print", separator: "Value " , terminator: "Value")
//Declaration
// Var for varable
// let for constant
//Data Types
//Typealias
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
print(maxAmplitudeFound)
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
//Operator
//Arithmetic Operators
print(10+50)
print(10-50)
print(10*50)
print(10/50)
//Remainder Operator
print(9%4)
//Unary Operator
let three = +3
let four = -4
print(three)
print(four)
//Comparison Operator
print(1==1)
print(2 != 1)
print(2>1)
print(1<2)
print(1>=2)
print(2<=1)
//Ternary Conditional Operator
var contentHeight = 40
let hasHeader = true
var rowHeight = contentHeight + (hasHeader ? 50 : 20)
if(hasHeader)
{
    rowHeight = 15
}
hasHeader ? (rowHeight = 15) : (contentHeight = 20)
//Nil-Coalescing Operator
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"

//Range Operator
//Close Range Operator
for index in 1...10 {
    print(index)
}
//Half-Open
let names1 = ["Albert", "Aryan", "Ajeet", "Jill"]
let count1 = names1.count
for i in 0..<count1 {
    print(names1[i])
}
//One-Sided
let names = ["Albert", "Aryan", "Ajeet", "Jill"]
let count = names.count
for name in names[2...] {
    print(name)
}

//Control Statement
//Switch
let dayOfWeek = 6
switch dayOfWeek {
case 1:
    print("It is Sunday today")
case 2:
    print("It is Monday today")
case 3:
    print("It is Tuesday today")
case 4:
    print("It is Wednesday today")
case 5:
    print("It is Thursday today")
case 6:
    print("It is Friday today")
case 7:
    print("It is Saturday today")
default:
    print("Invalid day")
}

//Switch statement with fallthrough
let dayOfWeek1 = 5
switch dayOfWeek1 {
case 1 :
    print("It is Sunday today")
case 2:
    print("It is Monday today")
case 3:
    print("It is Tuesday today")
case 4:
    print("It is Wednesday today")
case 5:
    print("It is Thursday today")
    fallthrough
case 6:
    print("It is Friday today")
case 7:
    print("It is Saturday today")
default:
    print("Invalid day")
}

//If Statement
let number = 5
if number > 0 {
    print("This is a positive number.")
}
else{
    print("This is a negative number.")
}
//if-else-if Statement
if number > 0 {
    print("This is a positive number.")
}
else if (number < 0) {
    print("This is a negative number.")
}
else {
    print("This number is 0.")
}
//Nested if-else Statement
let n1 = 10, n2 = 22, n3 = 25
if n1 >= n2 {
    if n1 >= n3 {
        print("The largest number is ", n1)
    }
    else {
        print("The largest number is ", n3)
    }
}
else {
    if n2 >= n3 {
        print("The largest number is ",  n2)
    }
    else {
        print("The largest number is ", n3)
    }
}
//guard
guard true else {
    print("Condition is not satisfied.")
    
}
print("Condition is satisfied.")
//Break Statement
var index = 10
repeat {
    index = index + 1
    if( index == 25 ) {
        break
    }
    print( "Value of index is \(index)")
} while index < 30

//Continue Statement
index=10
repeat {
    index = index + 1
    if( index == 25 ){
        continue
    }
    print( "Value of index is \(index)")
} while index < 30

//Loop
//For-in Loop
for i in 1...5 {
    print(i)
}
//While
var num1 = 5
while num1<5
{
    print(num1)
    num1 + 1
}
//Repeat While
num1 = 5
repeat
{
    print(num1)
    num1 + 1
}while num1<5
        
        //Collection
        //Array
        var intArr = [1, 2, 3, 4]
        intArr = [10,20,30, 40]
        print(intArr)
        
        //Dictionary
        let valDictionary = ["a":10, "b":20, "c":30, "d":40, "e":50, "f":60, "g":70, "h":80, "i":90]
        print(valDictionary)
        
        //Creating Dictionary from two arrays
        let customKeys = ["India", "Pakistan", "United Kingdom"]
        let customValues = ["New Delhi", "Islamabad", "London"]
        let newDictionary = Dictionary(uniqueKeysWithValues: zip(customKeys,customValues))
        print(newDictionary)
        
        //Set
        var someIntSet:Set = [1, 2, 3, 4, 5, 6]
        for val in someIntSet {
    print(val)
}
//Set Operations
var oddDigits: Set = [1, 3, 5, 7, 9]
print(oddDigits)
print(oddDigits.count)
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
print(oddDigits.union(evenDigits).sorted())
print(oddDigits.intersection(evenDigits).sorted())
print(oddDigits.subtracting(singleDigitPrimeNumbers).sorted())
//Descending Order Sort
print(oddDigits.union(evenDigits).sorted(by: >))

//Functions
func wish(user:String) {
    print("Good Morning \(user). Have a Good day.")
}
wish(user: "Jay")
//Functions with Parameter and Return Value
func greeting(name:String) -> String {
    return "Welcome to Swift " + name
}
let msg = greeting(name: "Jay")
print(msg)
//Optional Tuple Return Types
func minMax(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty { return nil }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
//Variadic Parameters
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
//IN-OUT Parameter
var a=10
var b=20
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
swapTwoInts(&a,&b)
print (a)
print (b)

//Closure
let simpleClosure:(String) -> (String) = { name in
    let greeting = "Hello Jay " + "Welcome to Swift"
    return greeting
}
let result1 = simpleClosure("Hello JavaTpoint")
print(result1)

//Enum
enum ConnectionStatus
{
    case Unknown
    case Disconnected
    case Connecting
    case Connected
}
var connectionStatus = ConnectionStatus.Connecting
connectionStatus = .Connected
switch connectionStatus {
case .Disconnected:
    print("Disconnected")
case .Connecting:
    print("Connecting")
case .Connected:
    print("Connected")
default:
    print("Unknown Status")
}
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
for beverage in Beverage.allCases {
    print(beverage)
}
//Structures
struct  Amount
{
    var rupees: Int
    var paisa: Int
}
var x = Amount (rupees: 10000, paisa: 50)
print(x)
//Classes
class Salary{
    var salary: Int
    init(salary: Int) {
        self.salary = salary
    }
}
class EmpSalary {
    var salary = 10000
}
let Income = EmpSalary()
print("Employee salary is \(Income.salary)")
//Properties
//Stored properties
class Person{
    var name:String = "Anonymous"
    var age:Int = 20
    init() {
    }
    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
}
var person = Person()
person.name = "John"
person.age = 23
debugPrint(person.name + " " + person.age.description)
//Lazy Stored Property
class DataImporter {
    var filename = "data.txt"
}
class DataManager {
    lazy var importer = DataImporter()
    var data: [String] = []
}
let manager = DataManager()
print(manager.importer.filename)

//Computed Properties
class Circle{
    var radius:Double
    var area:Double {
        get{
            return 3.14 * radius * radius
        }
        set(newValue) {
            radius = sqrt(newValue/3.14)
        }
    }
    init(radius:Double) {
        self.radius = radius
    }
}
var circle = Circle(radius: 100)
print("Area of circle is \(circle.area)")

//Property Observers
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

//Methods
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
let counter = Counter()
counter.increment()

//self Property
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}
somePoint.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint.x), \(somePoint.y))")

//subscript
class daysofaweek {
    private var days = ["Sunday", "Monday", "Tuesday", "Wednesday",
                        "Thursday", "Friday", "Saturday"]
    subscript(index: Int) -> String {
        get {
            return days[index]
        }
        set(newValue) {
            self.days[index] = newValue
        }
    }
    subscript(index: Int,index2:Int) -> String {
        get {
            return days[index]
        }
        set(newValue) {
            self.days[index] = newValue
            print(index2)
        }
    }
}
var p = daysofaweek()
print(p[0])
print(p[1])
print(p[2])
print(p[3])
print(p[4])
print(p[5])
print(p[6])

//Type Subscripts
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> Planet {
        return Planet(rawValue: n)!
    }
}
let mars = Planet[4]
print(mars)

//Optional Channing
class Person1 {
    var residence: Residence?
}
class Residence {
    var numberOfRooms = 1
}
let john = Person1()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
//Type casting
//In Operator
class Subjects {
    var physics: String
    init(physics: String) {
        self.physics = physics
    }
}

class Chemistry: Subjects {
    var equations: String
    init(physics: String, equations: String) {
        self.equations = equations
        super.init(physics: physics)
    }
}

class Maths: Subjects {
    var formulae: String
    init(physics: String, formulae: String) {
        self.formulae = formulae
        super.init(physics: physics)
    }
}
let sa = [
    Chemistry(physics: "solid physics", equations: "Hertz"),
    Maths(physics: "Fluid Dynamics", formulae: "Giga Hertz"),
    Chemistry(physics: "Thermo physics", equations: "Decibels"),
    Maths(physics: "Astro Physics", formulae: "MegaHertz"),
    Maths(physics: "Differential Equations", formulae: "Cosine Series")]
let samplechem = Chemistry(physics: "solid physics", equations: "Hertz")
print("Instance physics is: \(samplechem.physics)")
print("Instance equation is: \(samplechem.equations)")
let samplemaths = Maths(physics: "Fluid Dynamics", formulae: "Giga Hertz")
print("Instance physics is: \(samplemaths.physics)")
print("Instance formulae is: \(samplemaths.formulae)")
var chemCount = 0
var mathsCount = 0
for item in sa {
    if item is Chemistry {
        chemCount = +1
    } else if item is Maths {
        mathsCount = +1
    }
}
print("Subjects in chemistry contains \(chemCount) topics and maths contains \(mathsCount) topics")

//As Operator
for item in sa {
    if let Print = item as? Chemistry {
        print("Chemistry topics are: '\(Print.physics)', \(Print.equations)")
    } else if let example = item as? Maths {
        print("Maths topics are: '\(example.physics)', \(example.formulae)")
    }
}

//Inheritance
class Person2 {
    var firstName: String?
    var lastName: String?
    let birthPlace: String
    init(birthPlace: String) {
        self.birthPlace = birthPlace
    }
}
class Student: Person2
{
    var school: String?
}
let student = Student(birthPlace: "India")
student.lastName  = "Head"
student.firstName  = "Travis"
student.school = "abc"
print(student.birthPlace)
print(student.firstName)
print(student.lastName)
print(student.school)

//Error Handling
enum ErrorsToThrow: Error {
    case nameIsEmpty
}
class Human {
    var name:String?
    init(name:String?) throws {
        guard let name = name else {
            throw ErrorsToThrow.nameIsEmpty
        }
        self.name = name
    }
}
do {
    let humanObj = try Human(name: nil)
} catch ErrorsToThrow.nameIsEmpty {
    print("The name is empty.Cannot initialize human")
}
let humanObj1 = try? Human(name: "He-man") // returns Human?
let humanObj2 = try? Human(name: nil) // nil (humanObj2 is an optional which can handle nil)
