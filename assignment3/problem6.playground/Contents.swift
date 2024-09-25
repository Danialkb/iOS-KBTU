func fibonacci(_ n: Int) -> [Int] {
    // handle case where n is less than or equal to zero
    if n <= 0 {
        return []
    }

    var sequence: [Int] = [0, 1]

    if n == 1 {
        return [0]
    }

    // use a loop to generate the Fibonacci sequence
    for i in 2..<n {
        let nextNumber = sequence[i - 1] + sequence[i - 2]
        sequence.append(nextNumber)
    }

    return sequence
}

let fibSequence = fibonacci(1)
print(fibSequence)
