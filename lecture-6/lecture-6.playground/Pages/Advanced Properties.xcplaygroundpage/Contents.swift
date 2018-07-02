//: ## Advanced properties
//: ### Computed property
//: Computed Properties compute the value by providing a getter and an optional setter to retrieve and set other properties and values indirectly rather than storing values directly.
//: `get { }` : When retrieving the value of a property this block of code will get executed.
//: `set { }` : When setting the value of a property this part of code will get executed.
struct Circle {
    static let pi: Float = 3.14

    var rad: Float = 0
    var area : Float {
        get {
            return rad * rad * Circle.pi
        }
        set {
            rad = (newValue / Circle.pi).squareRoot()
        }
    }
}
var circle = Circle()
circle.area = 9         // set block is called
var ans = circle.area   // when get block is called,area is computed and returned to variable ans
var rad = circle.rad
//: >  By default setter has default parameter name called newValue. But we can also specify our own custom parameter name. For example setter can be written like this from below example using shorthand setter declaration.
//: ```swift
//: set {
//:    rad = newValue * 10
//: }
//: ```

//: #### Read only computed property: A property declared without set block can’t have newValue. It is a read-only property.
//: > Note : The get keyword can be omitted when set is not used because get is assumed by the swift compiler. For example :
struct Triangle {
    var length = 0
    var breadth = 0
    
    init(_ length : Int, _ breadth : Int) {
        self.length = length
        self.breadth = breadth
    }
    var perimeter: Int {       // Read only property
        return length * breadth
    }
}
var triangle = Triangle(5, 10)
var perimeter = triangle.perimeter

//: ### Property observers
//: Property observer is used to monitor and to respond accordingly whenever the property value is set and even the new property value is same as the old value. Property observer can define either willSet or didSet or both on property based on the situation.

//: **willSet** : It is called just before the value is set. willSet uses current property value in the default parameter name newValue when no custom parameter name is given.
//:
//: **didSet** : It is called right after the value is set. didSet uses old property value in the default parameter name oldValue when no custom parameter name is given.
struct Person {
    var name: String {
        // before the value is set
        willSet(currentName) { // custom parameter name is used
            print(" current name is about to set in property name ")
        }
        // property name is set here
        didSet {   // called after the value is set
            print(" old name \(oldValue) is changed to new name \(name)") // default parameter name oldName is used
        }
    }
}
var man = Person(name: "Person")
man.name = "xxx"


protocol Country {
    var name: String { get }
}

protocol Geographical {
    var area: Double { get }
}

class Kazakhstan: Country, Geographical {
    let area = 9000000.0
}

extension Country {
    var name: String {
        return String(describing: self)
    }
}

var country: Country

country = Kazakhstan()

print(country.name)


var middleName: String?

middleName = "John"

print()


//: [Previous](@previous) | [Next](@next)
