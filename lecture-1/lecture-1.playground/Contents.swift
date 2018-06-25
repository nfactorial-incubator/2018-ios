import UIKit

let n17r = "Welcome to nFactorial Incubator 2018"
let lecture = 1


// - Swift basics

// • Constants and variables
// Constants and variables must be declared before they’re used. You declare constants with the let keyword and variables with the var keyword.

/*
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
var x = 0.0, y = 0.0, z = 0.0
*/



// • Type Annotations
// You can provide a type annotation when you declare a constant or variable, to be clear about the kind of values the constant or variable can store.

/*
var welcomeMessage: String
var red, green, blue: Double

// Printing Constants and Variables
var friendlyWelcome = "Hello!"
print(friendlyWelcome)
*/


// • Integers and Floating-Point Numbers
// Double represents a 64-bit floating-point number.
// Float represents a 32-bit floating-point number.

/*
let int: Int = 8
let double: Double = 3.14
let float: Float = 3.14
*/


// • Booleans
// Swift has a basic Boolean type, called Bool. Boolean values are referred to as logical, because they can only ever be true or false. Swift provides two Boolean constant values, true and false:
/*
let orangesAreOrange = true
let turnipsAreDelicious = false
*/


// • Tuples
// Tuples group multiple values into a single compound value. The values within a tuple can be of any type and don’t have to be of the same type as each other.
/*
let http404Error = (404, "Not Found")

//You can decompose a tuple’s contents into separate constants or variables, which you then access as usual:
let (statusCode, statusMessage) = http404Error
*/





// • Basic Operators

// Operators are unary, binary, or ternary:
// Unary operators operate on a single target (such as -a). Unary prefix operators appear immediately before their target (such as !b), and unary postfix operators appear immediately after their target (such as c!).
// Binary operators operate on two targets (such as 2 + 3) and are infix because they appear in between their two targets.
// Ternary operators operate on three targets. Like C, Swift has only one ternary operator, the ternary conditional operator (a ? b : c).

/*
// Unary operator
let three = 3
let plusThree = +three
let minusThree = -three

// Binary operators
// The assignment operator (a = b) initializes or updates the value of a with the value of b:
let b = 10
var a = 5
a = b

// Arithmetic Operators
1 + 2       // equals 3
5 - 3       // equals 2
2 * 3       // equals 6
10.0 / 2.5  // equals 4.0
9 % 4    // equals 1

// Compound Assignment Operators
var compound = 1
compound += 2

// Comparison Operators
1 == 1   // true because 1 is equal to 1
2 != 1   // true because 2 is not equal to 1
2 > 1    // true because 2 is greater than 1
1 < 2    // true because 1 is less than 2
1 >= 1   // true because 1 is greater than or equal to 1
2 <= 1   // false because 2 is not less than or equal to 1

// Ternary Conditional Operator
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
*/


// • Range Operators
// Closed Range Operator
// The closed range operator (a...b) defines a range that runs from a to b, and includes the values a and b. The value of a must not be greater than b.
/*
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// Half-Open Range Operator
// The half-open range operator (a..<b) defines a range that runs from a to b, but doesn’t include b.
 
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}

// One-Sided Ranges
// The closed range operator has an alternative form for ranges that continue as far as possible in one direction
for name in names[2...] {
    print(name)
}

// Logical Operators
!true
true && false
true || false

*/



// • Strings and Characters

// Multiline String Literals
/*
let quotation = """
The White Rabbit put on his spectacles.  "Where shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on
till you come to the end; then stop."
"""

// Initializing an Empty String
var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other

//You can access the individual Character values for a String by iterating over the string with a for-in loop:
for character in "Dog!🐶" {
    print(character)
}

 
 
// Concatenating Strings and Characters
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

 
 
// String interpolation
//Swift uses string interpolation to include the name of a constant or variable as a placeholder in a longer string, and to prompt Swift to replace it with the current value of that constant or variable.
print("The current value of welcome is \(welcome)")

 
 
// Counting Characters
var word = "cafe"
print("the number of characters in \(word) is \(word.count)")

 
 
// String Indices
//You can use subscript syntax to access the Character at a particular String index.
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]

 
 
// Inserting and Removing
var hello = "hello"
hello.insert("!", at: hello.endIndex)
hello.insert(contentsOf: " there", at: hello.index(before: hello.endIndex))



// Substrings
let helloWorld = "Hello, world!"
let beginning = helloWorld[..<helloWorld.endIndex]



//  Prefix and Suffix Equality
greeting.hasSuffix("world")
greeting.hasPrefix("world")


*/

// • Collection types

/*
 
//Arrays
var someInts: [Int] = []
someInts.append(3)
someInts[0]
someInts.remove(at: 0)
someInts.count


//Sets
var letters = Set<Character>()
letters.insert("a")
letters.remove("a")

//Dictionaries
var namesOfIntegers: [Int: String] = [:]
namesOfIntegers[16] = "sixteen"

*/



// • Control Flow

/*
 
// For loops
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

// While
var i = 0
while (i < 5) {
    print(i)
    i += 1
}

// Repeat while
i = 0
repeat {
    print(i)
} while (i<5)

// If
let temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}


// switch
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}




let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

*/



// • Functions

/*
func greetPlain(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

// Functions With Multiple Parameters
func greet(name: String, surname: String) -> String {
    let greeting = "Hello, \(name) \(surname)"
    return greeting
}

//  Functions Without Return Values
func greet(person: String) {
    print("Hello, \(person)!")
}
greet(person: "Dave")


//Function Argument Labels and Parameter Names

func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // In the function body, firstParameterName and secondParameterName
    // refer to the argument values for the first and second parameters.
}
someFunction(firstParameterName: 1, secondParameterName: 2)

//Specifying Argument Labels
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}

//In-Out Parameters


func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

*/

