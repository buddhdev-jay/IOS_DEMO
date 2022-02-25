import UIKit
import CoreFoundation

var numbers = [10,20,30,45,6,599,78,60]
var num = numbers.filter{$0 % 5 == 0}
for i in numbers {
    if (i % 5 == 0){
        num?.append(i)
    }
}
print(<#T##items: Any...##Any#>)


//Functions
//External Parameter Names
func pow(firstArg a: Int, secondArg b: Int) -> Int {
    var res = a
    for _ in 1..<b {
        res = res * a
    }
    return res
}
print(pow(firstArg:5, secondArg:3))
//Nested Functions
func calcDecrement(forDecrement total: Int) -> () -> Int {
    var overallDecrement = 0
    func decrementer() -> Int {
        overallDecrement -= total
        return overallDecrement
    }
    return decrementer
}
let decrem = calcDecrement(forDecrement: 30)
print(decrem())
//Closures
//Closures as Function Parameter
func grabLunch(search: () -> ()) {
    search()
}
grabLunch(search: {
    print("Alfredo's Pizza: 2 miles away")
})
//Trailing Closure
func grabLunch2(message: String, search: ()->()) {
    print(message)
    search()
}
// use of trailing closure
grabLunch2(message:"Let's go out for lunch")  {
    print("Alfredo's Pizza: 2 miles away")
}
//Autoclosure
func display(greet: @autoclosure () -> ()) {
    greet()
}
display(greet: print("Hello World!"))

//enum with Associated Values
enum Distance {
    case km(String)
    case miles(String)
}
var dist1 = Distance.km("Metric System")
print(dist1)
var dist2 = Distance.miles("Imperial System")
print(dist2)

//Initialization
//Local & External Parameters
struct Days {
    let sunday, monday, tuesday: Int
    init(sunday: Int, monday: Int, tuesday: Int) {
        self.sunday = sunday
        self.monday = monday
        self.tuesday = tuesday
    }
    init(daysofaweek: Int) {
        sunday = daysofaweek
        monday = daysofaweek
        tuesday = daysofaweek
    }
}
let week = Days(sunday: 1, monday: 2, tuesday: 3)
print("Days of a Week is: \(week.sunday)")
print("Days of a Week is: \(week.monday)")
print("Days of a Week is: \(week.tuesday)")
let weekdays = Days(daysofaweek: 4)
print("Days of a Week is: \(weekdays.sunday)")
print("Days of a Week is: \(weekdays.monday)")
print("Days of a Week is: \(weekdays.tuesday)")
//Optional Property Types
struct Rectangle {
    var length: Double?
    
    init(_ area: Double) {
        length = area
    }
}
let rectarea = Rectangle(180.0)
print("area is: \(rectarea.length)")
let rearea = Rectangle(370.0)
print("area is: \(rearea.length)")
//Modifying Constant Properties During Initialization
struct Rectangle1 {
    var length: Double?
    
    init(_ area: Double) {
        length = area
    }
}
let rectarea1 = Rectangle1(180.0)
print("area is: \(rectarea1.length)")
let rearea1 = Rectangle1(370.0)
print("area is: \(rearea1.length)")
//Initializer Delegation for Value Types
struct Stmark {
    var mark1 = 0.0, mark2 = 0.0
}
struct stdb {
    var m1 = 0.0, m2 = 0.0
}
struct block {
    var average = stdb()
    var result = Stmark()
    init() {}
    init(average: stdb, result: Stmark) {
        self.average = average
        self.result = result
    }
    init(avg: stdb, result: Stmark) {
        let tot = avg.m1 - (result.mark1 / 2)
        let tot1 = avg.m2 - (result.mark2 / 2)
        self.init(average: stdb(m1: tot, m2: tot1), result: result)
    }
}
let set2 = block(average: stdb(m1: 2.0, m2: 2.0),result: Stmark(mark1: 5.0, mark2: 5.0))
print("student result is \(set2.average.m1) \(set2.average.m2) \(set2.result.mark1) \(set2.result.mark2)")
//Convenience Initializers
class mainClass {
    var noOne: Int
    init(noOne : Int) {
        self.noOne = noOne
    }
}
class subClass : mainClass {
    var noTwo: Int
    init(noOne: Int, noTwo: Int) {
        self.noTwo = noTwo
        super.init(noOne: noOne)
    }
    override convenience init(noOne: Int){
        self.init(noOne: noOne, noTwo: 0)
    }
}
let res = mainClass(noOne: 20)
let ressubclass = subClass(noOne: 30, noTwo: 50)
print("res is: \(res.noOne)")
print("res is: \(ressubclass.noOne)")
print("res is: \(ressubclass.noOne)")
//Failable Initializer
struct studrecord {
    let stname: String
    init?(stname: String) {
        if stname.isEmpty {return nil }
        self.stname = stname
    }
}
let stmark = studrecord(stname: "Swing")
let blankname = studrecord(stname: "")
if blankname == nil {
    print("Student name is left blank")
}
//Failable Initializers for Enumerations
enum functions {
    case a, b, c, d
    init?(funct: String) {
        switch funct {
        case "one":
            self = .a
        case "two":
            self = .b
        case "three":
            self = .c
        case "four":
            self = .d
        default:
            return nil
        }
    }
}
let result = functions(funct: "two")
print(result)
let empty = functions(funct: "")
print(empty)
//
class  Race {
    var laps: Int
    init(laps: Int) {
        self.laps = laps
        print("Race Completed")
        print("Total laps:", laps)
    }
    deinit {
        print("Memory Deallocated")
    }
}
var resultOne: Race?
//Overriding
class Vehicle {
    func displayInfo() {
        print("Four Wheeler or Two Wheeler")
    }
}
class Car: Vehicle {
    override func displayInfo() {
        print("Four Wheeler")
    }
}
var carTwo =  Car()
carTwo.displayInfo()
// we can prevent overriding by puting Final Keyword before displayInfo() method
//Reference Counting
var resultTwo: Race?
resultOne = Race(laps: 5)
resultTwo = resultOne
resultOne = nil
resultTwo = nil
weak var resultThree : Race?
resultThree  = resultOne
resultOne = nil
//ERROR Handling
enum DivisionError: Error {
    case dividedByZero
}
func division(numerator: Int, denominator: Int) throws {
    if denominator == 0 {
        throw DivisionError.dividedByZero
    }
    else {
        let result = numerator / denominator
        print(result)
    }
}
do {
    try division(numerator: 10, denominator: 0)
    print("Valid Division")
}
catch DivisionError.dividedByZero {
    print("Error: Denominator cannot be 0")
}
//If we want to disable the error handling then we put !try before function name
//Nested Types
class Employee {
    var dept = Department()
    class Department {
        var EmpId = 150;
        var EmpName = "Suresh Dasari";
        func GetDetails() -> String {
            return "Id: \(self.EmpId), Name: \(self.EmpName)"
        }
    }
}
var emp = Employee()
print(emp.dept.GetDetails())
//Optional Chaining
class ElectionPoll {
    var candidate: Pollbooth?
}
class Pollbooth {
    var name = "MP"
}
let cand = ElectionPoll()
if let candname = cand.candidate?.name {
    print("Candidate name is \(candname)")
} else {
    print("Candidate name cannot be retreived")
}
