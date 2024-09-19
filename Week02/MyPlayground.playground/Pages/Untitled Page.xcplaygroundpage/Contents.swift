//: [Previous](@previous)

import Foundation

let path = Bundle.main.path(forResource: "mickey.txt", ofType: nil)
let str = try String(contentsOfFile: path!, encoding: .utf8)
print(str)
print("Number of characters:", str.count)

let newPath = Bundle.main.path(forResource: "smallMickey.txt", ofType: nil)
let newMickey = try String(contentsOfFile: newPath!, encoding: .utf8)

let lines = str.split(separator: "\n", omittingEmptySubsequences: false)
print("Number of lines: \(lines.count)")

print(lines)
print()

//removing white space
let cleanedStr = str.filter { !$0.isWhitespace }
print("Number of characters when white space is removed:", cleanedStr.count)

print(cleanedStr)
print()

for num in 1...lines.count {
    print(num, newMickey)
}
//: [Next](@next)
