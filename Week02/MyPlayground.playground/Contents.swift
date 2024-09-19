import UIKit


// Path to the local RTF file "asciiCat.rtf" in the same folder
let filePath = FileManager.default.currentDirectoryPath + "./Resources/asciiCat.txt"
let fileURL = URL(fileURLWithPath: filePath)

let path = Bundle.main.path(forResource: "aardvark.txt", ofType: nil)
let str = try String(contentsOfFile: path!, encoding: .utf8)

do {
    // Read the content of the RTF file as attributed string
    let rtfData = try Data(contentsOf: fileURL)
    //got this line from ChatGPT
    let attributedString = try NSAttributedString(data: rtfData, options: [.documentType: NSAttributedString.DocumentType.txt], documentAttributes: nil)
    
    // Convert the attributed string to plain text
    let plainText = attributedString.string
    
    // Print the plain text content of the RTF file (ASCII cat)
    print(plainText)
    
} catch {
    print("Error reading TXT file: \(error)")
}
