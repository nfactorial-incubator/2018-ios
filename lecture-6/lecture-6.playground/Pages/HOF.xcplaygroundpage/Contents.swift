//: ## Higher Order Functions in Swift

//: ### MAP
//: Loops over a collection and applies the same operation to each element in the collection.
var numberArray = [1, 2, 3, 4, 5]
//:
//: ###### The traditional way
var emptyArray: [Int] = []
for number in numberArray {
    emptyArray.append(number*2)
}
emptyArray
//: ###### Map
var newArray1 = numberArray.map { value in
    return value * 2
}
newArray1
var newArray2 = numberArray.map{ value in value * 2}
newArray2
var newArray3 = numberArray.map{ $0 * 2 }
newArray3


//: ### Filter
//: Loops over a collection and returns an array that contains elements that meet a condition.
//:
//: ###### The traditional way
let numbersArray2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
var evenNumberArray: [Int] = []
for number in numbersArray2  {
    if number%2 == 0 {
        evenNumberArray.append(number)
    }
}
evenNumberArray
//: ###### Filter
let evenArray = numbersArray2.filter{ $0 % 2 == 0 }
evenArray


//: ### Reduce
//: Combines all items in a collection to create a single value.
//: ###### The traditional way
var sum = 0
for num in numberArray {
    sum += num
}
sum
//: ###### Reduce
var sum2 = numberArray.reduce(0, { $0 + $1 })
sum2
sum2 = numberArray.reduce(0, *)
//:


//: ### CompactMap (ex. FlatMap)
//: When implemented on sequences : Flattens a collection of collections.
//: ###### The traditional way
let arrayInArray = [[0, 1, 2], [3, 4, 5]]
var emptyArray2: [Int] = []
for array in arrayInArray {
    emptyArray2 += array
}
emptyArray2
//: ###### CompactMap
let flattenedArray = arrayInArray.compactMap {$0}

//: Implemented on optionals : Removes nil from the collection.
let people: [String?] = ["12", nil, "23", "43"]
let validPeople = people.compactMap {$0}
validPeople


//: ### Chaining
//: You can combine all those HOFs you’ve just learned in one line of code!
var arrayWith$ = arrayInArray.compactMap{$0}.map{"kzt\($0)"}
arrayWith$


//: [Previous](@previous) | [Next](@next)
