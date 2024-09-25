func isPalindrome(_ text: String) -> Bool {
    let filteredText = text.lowercased().filter { $0.isLetter }
    
    return filteredText == String(filteredText.reversed())
}

let input = readLine()
print(isPalindrome(input!))
