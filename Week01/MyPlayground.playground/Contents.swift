import UIKit

func printChar(length: Int){
    var mult = Int(2)
    for i in 1...length{
        if i.isMultiple(of: mult){
            print("👾", terminator: "")
        } else {
            print("🤡", terminator: "")
        }
    }
}

printChar(length: 11)
