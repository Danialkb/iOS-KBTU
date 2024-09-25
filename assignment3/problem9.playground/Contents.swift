func addNumbers(_ firstNumber: Int, _ secondNumber: Int) -> Int {
    return firstNumber + secondNumber
}

func substractNumbers(_ firstNumber: Int, _ secondNumber: Int) -> Int {
    return firstNumber - secondNumber
}

func multiplyNumbers(_ firstNumber: Int, _ secondNumber: Int) -> Int {
    return firstNumber * secondNumber
}

func divideNumbers(_ firstNumber: Int, _ secondNumber: Int) -> Double {
    return Double(firstNumber) / Double(secondNumber)
}

func startCalculatorApp() {
    
    while true {
        print("Enter the first number: ", terminator: "")
        if let firstInput = readLine(), let firstNumber = Int(firstInput) {
            print("Enter the second number: ", terminator: "")
            if let secondInput = readLine(), let secondNumber = Int(secondInput) {
                print("Enter operation: +, -, / or *. Enter Q to quit app")
                let operationInput = readLine()
                switch operationInput{
                case "+":
                    print(addNumbers(firstNumber, secondNumber))
                case "-":
                    print(substractNumbers(firstNumber, secondNumber))
                case "*":
                    print(multiplyNumbers(firstNumber, secondNumber))
                case "/":
                    if secondNumber == 0 {
                        print("Cannot divide by 0")
                        continue
                    }
                    print(divideNumbers(firstNumber, secondNumber))
                default:
                    print("Choose correct operation")
                }
            } else {
                print("Invalid input for the second number.")
            }
            
        } else {
            print("Invalid input for the first number.")
        }
    }
}

startCalculatorApp()
