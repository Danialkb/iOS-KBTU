// function to convert Celsius to Celsius and Kelvin
func convertFromCelsius(_ celsius: Double) -> (fahrenheit: Double, kelvin: Double) {
    let fahrenheit = (celsius * 9/5) + 32
    let kelvin = celsius + 273
    return (fahrenheit, kelvin)
}

// function to convert Fahrenheit to Celsius and Kelvin
func convertFromFahrenheit(_ fahrenheit: Double) -> (celsius: Double, kelvin: Double) {
    let celsius = (fahrenheit - 32) * 5/9
    let kelvin = celsius + 273
    return (celsius, kelvin)
}

// function to convert Kelvin to Celsius and Fahrenheit
func convertFromKelvin(_ kelvin: Double) -> (celsius: Double, fahrenheit: Double) {
    let celsius = kelvin - 273
    let fahrenheit = (celsius * 9/5) + 32
    return (celsius, fahrenheit)
}

func temperatureConverter() {
    print("Enter the temperature value:")
    guard let input = readLine() else {
        print("Incorrect input")
        return
    }
    guard let temperature = Double(input) else {
        print("Input value \(input) cannot be converted to Double")
        return
    }

    print("Enter the option (C for Celsius, F for Fahrenheit, K for Kelvin):")
    guard let option = readLine()?.uppercased() else {
        print("Invalid input.")
        return
    }

    switch option {
    case "C":
        let (fahrenheit, kelvin) = convertFromCelsius(temperature)
        print("Fahrenheit: \(fahrenheit)°F")
        print("Kelvin: \(kelvin)K")
    case "F":
        let (celsius, kelvin) = convertFromFahrenheit(temperature)
        print("Celsius: \(celsius)°C")
        print("Kelvin: \(kelvin)K")
    case "K":
        let (celsius, fahrenheit) = convertFromKelvin(temperature)
        print("Celsius: \(celsius)°C")
        print("Fahrenheit: \(fahrenheit)°F")
    default:
        print("Invalid option. Please enter C, F, or K.")
    }
}

temperatureConverter()
