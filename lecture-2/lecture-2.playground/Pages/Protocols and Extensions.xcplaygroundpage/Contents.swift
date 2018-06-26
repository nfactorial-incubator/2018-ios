//: ## Protocols and Extensions
//:
//: Use `protocol` to declare a protocol.
//:
//: You define protocols in a very similar way to classes, structures, and enumerations:

protocol SomeProtocol {
    // protocol definition goes here
}

protocol AnotherProtocol {
    // protocol definition goes here
}

//: Multiple protocols can be listed, and are separated by commas:

struct SomeStructure: SomeProtocol, AnotherProtocol {
    // structure definition goes here
}

//: If a class has a superclass, list the superclass name before any protocols it adopts, followed by a comma:
class SomeSuperclass {

}

class SomeClass: SomeSuperclass, SomeProtocol, AnotherProtocol {
    // class definition goes here
}

//: Property requirements are always declared as variable properties, prefixed with the var keyword. Gettable and settable properties are indicated by writing { get set } after their type declaration, and gettable properties are indicated by writing { get }.

protocol SomeExampleProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

//: Method Requirements
//: The following example defines a protocol with a single instance method requirement:

protocol RandomNumberGenerator {
    func random() -> Double
}

//: Mutating Method Requirements
//: It’s sometimes necessary for a method to modify (or mutate) the instance it belongs to. For instance methods on value types (that is, structures and enumerations) you place the mutating keyword before a method’s func keyword to indicate that the method is allowed to modify the instance it belongs to and any properties of that instance

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
// lightSwitch is now equal to .on

//: Initializer Requirements
//: Protocols can require specific initializers to be implemented by conforming types.

protocol SomeInitProtocol {
    init(someParameter: Int)
}

//: Classes, enumerations, and structs can all adopt protocols.

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
     var simpleDescription: String = "A very simple class."
     var anotherProperty: Int = 69105
     func adjust() {
          simpleDescription += "  Now 100% adjusted."
     }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
     var simpleDescription: String = "A simple structure"
     mutating func adjust() {
          simpleDescription += " (adjusted)"
     }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//: - Experiment:
//: Write an enumeration that conforms to this protocol.
//:
//: Notice the use of the `mutating` keyword in the declaration of `SimpleStructure` to mark a method that modifies the structure. The declaration of `SimpleClass` doesn’t need any of its methods marked as mutating because methods on a class can always modify the class.
//:
//: Use `extension` to add functionality to an existing type, such as new methods and computed properties. You can use an extension to add protocol conformance to a type that is declared elsewhere, or even to a type that you imported from a library or framework.
//:
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
 }
print(7.simpleDescription)


//: Declaring Protocol Adoption with an Extension
//: If a type already conforms to all of the requirements of a protocol, but has not yet stated that it adopts that protocol, you can make it adopt the protocol with an empty extension:
//:

protocol TextRepresentable {
    var textualDescription: String { get }
}

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

//: Protocol Inheritance
//: A protocol can inherit one or more other protocols and can add further requirements on top of the requirements it inherits.
//: Here’s an example of a protocol that inherits the TextRepresentable protocol from above:

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

//: Protocol Composition
//: It can be useful to require a type to conform to multiple protocols at the same time. You can combine multiple protocols into a single requirement with a protocol composition.
//: Protocol compositions have the form SomeProtocol & AnotherProtocol.
//:

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

let birthdayPerson = Person(name: "Malcolm", age: 21)
wishHappyBirthday(to: birthdayPerson)

//: Protocol Extensions
//: This allows you to define behavior on protocols themselves, rather than in each type’s individual conformance or in a global function.
//:

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

//: Providing Default Implementations
//: You can use protocol extensions to provide a default implementation to any method or computed property requirement of that protocol
//:

extension PrettyTextRepresentable  {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

//:
//: You can use a protocol name just like any other named type—for example, to create a collection of objects that have different types but that all conform to a single protocol. When you work with values whose type is a protocol type, methods outside the protocol definition are not available.
//:
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty)  // Uncomment to see the error

//: Even though the variable `protocolValue` has a runtime type of `SimpleClass`, the compiler treats it as the given type of `ExampleProtocol`. This means that you can’t accidentally access methods or properties that the class implements in addition to its protocol conformance.
//:




//: [Previous](@previous) | [Next](@next)
