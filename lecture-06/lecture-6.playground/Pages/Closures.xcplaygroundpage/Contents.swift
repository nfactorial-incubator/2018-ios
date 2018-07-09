
//: ## Closures
//:
//: You define a function with the `func` keyword. Functions can take and return none, one or multiple parameters (tuples).

func jediGreet(_ name: String, _ ability: String) -> (farewell: String, mayTheForceBeWithYou: String) {
    return ("Good bye, \(name).", " May the \(ability) be with you.")
}

let value = jediGreet("old friend", "Force")
print(value)
print(value.farewell)
print(value.mayTheForceBeWithYou)

//: ### Function types
//: Every function has its own function type, made up of the parameter types and the return type of the function itself. For example the following function:

func doSometingWithInt(someInt:Int, anotherInt: Int) -> Int {
    return someInt * 2
}
//: has a function type of:
//: **(int) -> (int)**


//: ### Defining a closure :
//: Understanding a closure syntax is pretty easy. You now knows what a function type is. Just put the function type within a pair of curly braces and add a in keyword after the return type. The in keyword is followed by the statements. It became a closure expression.

//: { (params) -> returnType in
//:
//:    statements
//:
//: }

//: Let’s create a function which accepts two int values and return the sum as int.
func addTwoNumbers(number1: Int, number2: Int) -> Int {
    return number1 + number2
}

addTwoNumbers(number1: 8, number2: 2)

//: Now let’s create a closure for the same operation:
let closure = { (number1: Int, number2: Int) -> Int in
    return number1 + number2
}
let closure2: (Int, Int) -> Int = { number1, number2 in
    return number1 + number2
}
closure(8,2)
closure2(8,2)

//: #### Shorthand Argument Names
//: Closure arguments can be references by position ($0, $1, …) rather than by name.
var shortHandClosure: (Int,Int) -> Int = {
    return $0 + $1
}
shortHandClosure(8,2)
//:
var superShortClosure: (Int,Int)->Int = {$0 + $1}
superShortClosure(8, 2)
//:

//: #### Inferred type closure
//: A closure of type (Int,Int)->Int is inferred in the following code:
let inferredClosure = { (x: Int, y: Int) -> Int in return (x + y) }
inferredClosure(1,99)

//: Return types can also be inferred:
let inferredReturnTypeClosure = {(number:Int) in number*number }

//: Closure that takes nothing and returns a string:
let callStringWithClosure: () -> String = { () in
    return "hello"
}
print(callStringWithClosure())


//: Since, we don’t care about the input parameters here, we can omit the () in inside the closure body.
let callStringWithClosure2: () -> String = { return "hello" }

//: Also, since it returns a String and it doesn’t take any parameters, we can omit the type as well.
let callStringWithClosureWithoutType = { "hi, I’m a closure too" }
//:


//: #### Trailing Closures
//: If you need to pass a closure expression to a function as the function’s final argument and the closure expression is long, it can be useful to write it as a trailing closure instead. A trailing closure is written after the function call’s parentheses, even though it is still an argument to the function. When you use the trailing closure syntax, you don’t write the argument label for the closure as part of the function call.

func doSomething(number: Int, onSuccess closure: (Int) -> Void) {
    closure(number * number * number)
}
doSomething(number: 10, onSuccess: { number in
    print("num", number)
})
doSomething(number: 100) { (numberCube) in
    print("num", numberCube)
}

//: ### Escaping closure vs non-escaping closure
//: There are two kinds of closures:
//: 1. **Non-escaping closures** have a very clear lifecycle and have become the default closure type in Swift 3 because of it. A non-escaping closure is simple: It’s passed into a function (or other containing scope), the function/scope executes that closure, and the function returns. The closure cannot return or finish executing after the body of the calling function has returned.
//:
//: Lifecycle of the @nonescaping closure:
//: 1. Pass the closure as function argument, during the function call.
//: 2. Do some additional work with function.
//: 3. Function runs the closure.
//: 4. Function returns the compiler back.

func getSumOf(array:[Int], handler: ((Int)->Void)) {
    //step 2
    var sum: Int = 0
    for value in array {
        sum += value
    }
    
    //step 3
    handler(sum)
}

func doSomething() {
    //setp 1
    getSumOf(array: [16,756,442,6,23]) { (sum) in
        print(sum)
        //step 4, finishing the execution
    }
}
doSomething()

//:
//: 2. **Escaping closures** are more complex — they’re named that way because their return can escape the body of the calling function; the closure can be stored somewhere that will be retained after the calling function has finished executing.
//: Common use cases for this are:
//: - Asynchronous calls; networking.
//: - Functions stored as variables; think actions and supplied callbacks.
//: - Scheduling tasks on a dispatch queue.
//:
//: Lifecycle of the @escaping closure:
//: 1. Pass the closure as function argument, during the function call.
//: 2. Do some additional work in function.
//: 3. Function execute the closure asynchronously or stored.
//: 4. Function returns the compiler back.
import Foundation
func getSumOf2(array:[Int], handler: @escaping ((Int)->Void)) {
    //step 2
    var sum: Int = 0
    for value in array {
        sum += value
    }
    //step 3
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        handler(sum)
    }
}

func doSomething2() {
    //step 1
    getSumOf2(array: [16,756,442,6,23]) { (sum) in
        print(sum)
        //step 4, finishing the execution
    }
}

doSomething2()


//: ### Autoclosures
//: An autoclosure is a closure that is automatically created to wrap an expression that’s being passed as an argument to a function. It doesn’t take any arguments, and when it’s called, it returns the value of the expression that’s wrapped inside of it. This syntactic convenience lets you omit braces around a function’s parameter by writing a normal expression instead of an explicit closure.


var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

let customerProvider = { customersInLine.remove(at: 0) } // this is of type ()->String
print(customerProvider()) // prints Chris.. the remove(at:) returns a String.

//Consider the above function passed on to a function as argument.
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

serve(customer: { customerProvider() } ) // we cannot omit {}


func serve2(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve2(customer: customersInLine.remove(at: 0))



//: [Previous](@previous) | [Next](@next)
