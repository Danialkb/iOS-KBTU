func isPrime(number: Int) -> Bool {
    if number <= 1 {
       return false
   }

   for i in 2..<number {
      if number % i == 0 {
         return false
       }
   }
   return true
}

for i in 1...100 {
    let isPrimeNumber = isPrime(number: i)
    print(isPrimeNumber ? "\(i) is prime number" : "\(i) is NOT prime number")
}
