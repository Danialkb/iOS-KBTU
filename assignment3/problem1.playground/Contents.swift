for i in 1...100 {
    var output = ""
    if (i % 3 == 0) {
        output += "Fizz"
    }
    if (i % 5 == 0) {
        output += "Buzz"
    }
    if (output != "") {
        print(i, output)
    }
}
