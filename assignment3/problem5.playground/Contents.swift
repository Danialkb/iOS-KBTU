func startFrequencyCounter() {
    print("Enter sentence:")
    guard var inputSentence = readLine() else {
        print("Incorrect input")
        return
    }
    
    inputSentence = inputSentence.lowercased().filter { char in
        char.isLetter || char.isWhitespace
    }
    
    let wordList = inputSentence.split(separator: " ")
    
    var wordFrequencyMap: [String: Int] = [:]
    
    for word in wordList {
        let wordString = String(word).lowercased()
        if wordFrequencyMap[wordString] == nil {
            wordFrequencyMap[wordString] = 0
        }
        wordFrequencyMap[wordString]! += 1
    }
    print(wordFrequencyMap)
}

startFrequencyCounter()
