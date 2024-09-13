import UIKit

// Easy tasks
// 1
var fruits: [String] = ["apple", "banana", "straweberry", "melon", "watermelon"]
print(fruits[2])

// 2
var nums: Set<Int> = [1, 2, 3, 4, 5]
nums.insert(100)
print(nums)

// 3
var dict: [String: Int] = ["Swift": 1900, "C++": 1910, "C": 1909]
print(dict["Swift"])

// 4
var colors = ["Red", "green", "Blue", "yellow"]
colors[1] = "orange"
print(colors)

// Medium tasks
// 1
var set1: Set<Int> = [1, 2]
var set2: Set<Int> = [1, 2, 3]
print(set1.intersection(set2))

// 2
var studentScoresMap: [String: Int] = ["Danial": 1, "Lera": 2, "Bak": 4]
studentScoresMap["Danial"] = 2
print(studentScoresMap)

// 3
var a1 = ["apple", "banana"]
var a2 = ["cherry", "date"]
var merge = a1 + a2
print(merge)

// Hard tasks
// 1
var countryPopulationMap: [String: Int] = ["Kazakhstan": 100]
countryPopulationMap["China"] = 101
print(countryPopulationMap)

// 2
var animalSet1: Set<String> = ["cat", "dog"]
var animalSet2: Set<String> = ["dog", "mouse"]
var union: Set<String> = animalSet1.union(animalSet2)

union.subtract(animalSet2)
print(union)

// 3
var studentGradesMap: [String: [Int]] = ["Danial": [1, 2, 3], "Lera": [2, 7, 9], "Bak": [4, 12, 2]]
print(studentGradesMap["Lera"]?[1])
