func hasUniqueCharacters(_ text: String) -> Bool {
    var uniqueChars = Set<Character>()
    
    for char in text {
        if uniqueChars.contains(char) {
            return false
        }
        uniqueChars.insert(char)
    }
    
    return true
}


let input = readLine()
print(hasUniqueCharacters(input!))
