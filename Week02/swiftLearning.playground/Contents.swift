import UIKit

//checkpoint 4

enum NumError: Error {
    case small, large
}

func numCheck(num: Int) throws -> String {
    if num < 1 {
        throw NumError.small
    }
    
    if num > 10_000 {
        throw NumError.large
    }
    
    // Check if the number is a perfect square
    for root in 1...100 {
        if root * root == num {
            return "The square root of \(num) is \(root)"
        }
    }
    
    return "There is no integer root"
}

do {
    let result = try numCheck(num: 9)
    print(result)
} catch {
    print("There was an error: \(error)")
}


//checkpoint 5
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
var newNumbers = [Int]()
for luckyNumber in luckyNumbers {
    if !luckyNumber.isMultiple(of: 2){
        newNumbers.append(luckyNumber)
    }
}
let sortedNumbers = newNumbers.sorted()
let mappedNumbers = sortedNumbers.map {String($0)}

for num in mappedNumbers{
    print("\(num) is a lucky number")
}

//Closure Version (ChatGPT)
let luckyNumbers2 = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

luckyNumbers2
    .filter { !$0.isMultiple(of: 2) }
    .sorted()
    .map { "\($0) is a lucky number" }
    .forEach { print($0) }

//checkpoint 6
struct Car {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int
 
// Method to change the gear, accepting a new gear value.
    mutating func changeGear(to newGear: Int) {
        if newGear >= 1 && newGear <= 10 {
            currentGear = newGear
            print("Gear changed to \(newGear).")
        } else {
            print("Invalid gear: \(newGear). Gear must be between 1 and 10.")
        }
    }
}
var myCar = Car(model: "Toyota Corolla", numberOfSeats: 5, currentGear: 1)
myCar.changeGear(to: 3)

//checkpoint 7
class Animals {
    var legs = Int()
    init(legs: Int) {
        self.legs = legs
    }
}

class Dogs: Animals {
    func speak() {
        print("Woof Woof")
    }
}

class Poodle: Dogs {
    override func speak() {
        print("Poodle Woof")
    }
}

class Corgi: Dogs {
    override func speak() {
        print("Corgi Woof")
    }
}

class Cats: Animals{
    var isTame: Bool
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    func speak(){
        print("Meow")
    }
}

class Lion: Cats{
    override func speak() {
        print("Roar")
    }
    
}

class Persian: Cats {
    override func speak(){
        print("meow")
    }
    
}
let corgi = Corgi(legs: 4)
let poodle = Poodle(legs: 4)
let persian = Persian(legs: 4, isTame: true)
let lion = Lion(legs: 4, isTame: false)

corgi.speak()
poodle.speak()
persian.speak()
lion.speak()

//checkpoint 8

protocol Building {
    var rooms: Int {get}
    var cost: Int {get}
    var agent: String {get}
    
    func salesSummary()
    
}

struct House: Building{
    var rooms: Int
    var cost: Int
    var agent: String
    
    func salesSummary() {
        print("House for sale! \(rooms) rooms, $\(cost), Estate Agent: \(agent). Has Hmart nearby!")
    }
    
}

struct Office: Building{
    var rooms: Int
    var cost: Int
    var agent: String
    
    func salesSummary() {
        print("Office for sale! \(rooms) rooms, $\(cost), Estate Agent: \(agent). Near the RNQW subway!")
    }
}
let myHouse = House(rooms: 4, cost: 500000, agent: "John Smith")
let myOffice = Office(rooms: 10, cost: 1000000, agent: "Jane Doe")

myHouse.salesSummary()
myOffice.salesSummary()
