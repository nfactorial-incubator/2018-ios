//: ## Optionals
//:
//: Optionals are a powerful feature in Swift language which come to solve the problem of non-existing values.
//:
//:Optional is just a type in Swift language, nothing fancy. Int and Int? (optional Int) are two different types, if your variable happens to be of type Int you can be absolutely sure it will always have an integer value, and if your variable is of type Int? it will either have an integer value or it will have no value at all (in other words, it will be nil).
//:
//: Under the hood optional types are merely an enum with two cases — None meaning no value is set and Some meaning the value is set and it’s the value associated with it.
enum Optional<T> {
    case None
    case Some(T)
}

// these two statements are exactly the same
let x: String? = nil
let x2 = Optional<String>.None

//:
//: ### - Forced Unwrapping
let optionalInt: Int? = 5






struct SomeStruct {
    let optionalInt: Int?
    //: We put the “!” mark after the variable’s name meaning “I’m sure this variable contains something, extract that value and use it”.

}
let struct1 = SomeStruct(optionalInt: nil)

print(struct1.optionalInt!)

//: It’s generally a “dangerous” thing to do because if the box is empty the app will crash at runtime. A good practice is to check for nil before unwrapping.
if optionalInt != nil {
    print("optionalInt has an integer value of \(optionalInt!).")
}

//: ### Optional Binding
//: It allows to check the optional and extract its value into a constant or variable as part of a single action.
if let constantInt = optionalInt {
    print("optionalInt has an integer value of \(constantInt).")
} else {
    print("optionalInt is nil")
}

func method() {
    guard let constantInt = optionalInt else {
        return
    }
    
    print(constantInt)
    var var1 = 1 + constantInt
    
    
}



//:
//: ### Implicitly Unwrapped Optionals
//: Sometimes we’re really-really sure we’ll always have a value in our optional just after it’s set the first time. Implicitly unwrapped optionals come to help in this case, it’s sort of saying “unwrap this guy once and use the value anywhere you want”.

// forced unwrapping
let optionalInt2: Int? = 123
let forcedInt: Int = optionalInt2!
    
// implicitly unwrapped optional
let assumedInt: Int! = 123
let implicitInt: Int = assumedInt

//:
//: ### Nil coalescing
//: Sometimes we want to use a default value when the optional is nil. This could be reduced to a one line by using a ternary operator

let optional: Int? = nil
let result = optional != nil ? optional! : 0
print("The result is \(result)")
//: Nil coalescing allows us to shorten this even more.
var nextResult = optionalInt ?? 0
print("The result is \(nextResult)")

switch(optionalInt) {
case .some(let value):
    nextResult = value
case .none:
    nextResult = 0
}
//:
//: ### Optional Chaining
//: Optional chaining is a feature that allows to call properties and methods on an optional that might currently be nil. Unlike forced unwrapping which would result in a runtime exception, optional chaining fails gracefully when the optional is nil.

class Person {
    var bankAccount: BankAccount?
}

class BankAccount {
    let balance: Int = 0
}

let person = Person()

if let currentBalance = person.bankAccount?.balance {
    print("Person has a bank account and its balance is \(currentBalance)")
} else {
    print("Person has no bank account")
}
//: [Previous](@previous) | [Next](@next)
