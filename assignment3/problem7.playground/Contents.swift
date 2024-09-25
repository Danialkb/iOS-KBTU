var studentScoreMap: [String: [Double]] = ["Danial": [1.0, 2.0, 3.3], "Lera": [5.0, 4.4, 3.5], "John": [1.3, 3.2, 4.7]]

func getAverageScore(_ studentScoreMap: [String: [Double]]) -> Double {
    let studentsScoreList = studentScoreMap.values
    
    var numberOfScores = 0
    var totalScoresSum = 0.0
    
    print(studentsScoreList)
    
    for studentScores in studentsScoreList {
        for studentScore in studentScores {
            totalScoresSum += studentScore
        }
        numberOfScores += studentScores.count
    }
    
    if numberOfScores == 0 {
        return 0.0
    }
    
    return totalScoresSum / Double(numberOfScores)
}

func getHighestScore(_ studentScoreMap: [String: [Double]]) -> Double {
    let studentsScoreList = studentScoreMap.values
    
    var highestScore = -1.0
    
    for studentScores in studentsScoreList {
        for studentScore in studentScores {
            highestScore = max(highestScore, studentScore)
        }
    }
    
    return highestScore
}

func getLowestScore(_ studentScoreMap: [String: [Double]]) -> Double {
    let studentsScoreList = studentScoreMap.values
    
    var lowestScore = 100000.0
    
    for studentScores in studentsScoreList {
        for studentScore in studentScores {
            lowestScore = min(lowestScore, studentScore)
        }
    }
    
    return lowestScore
}

func displayStudentsComparedToAverage(_ studentScoreMap: [String: [Double]]) -> Void {
    let averageStudentsScore = getAverageScore(studentScoreMap)
    
    for (studentName, studentScores) in studentScoreMap {
        let studentAverageScore = (studentScores.reduce(0.0, +)) / Double(studentScores.count)
        let isAboveAverage = (studentAverageScore > averageStudentsScore)
        print(studentName, studentAverageScore, isAboveAverage ? "Student Score is ABOVE average" : "Student Score is BELOW average")
    }
}

print(getAverageScore(studentScoreMap))
print(getHighestScore(studentScoreMap))
print(getLowestScore(studentScoreMap))
displayStudentsComparedToAverage(studentScoreMap)
