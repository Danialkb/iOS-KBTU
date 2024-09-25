// function to add new items in cart
func addItem(cart: inout [String], newItem: String) -> Void {
    cart.append(newItem)
}

// function to remove item from cart
func removeItem(cart: [String], itemToRemove: String) -> [String] {
    return cart.filter(){$0 != itemToRemove}
}

// Main function
func startShopping() {
    var shoppingCart = ["Item1", "Item2", "Item3"]
    while true {
        print("Your shopping cart: \(shoppingCart)")
        print("Select operation: A (Add Item), R (Remove Item), Q (Quit)")
        
        guard let option = readLine() else {
            print("Invalid input.")
            return
        }
        switch option {
        case "A":
            print("Enter new item name:")
            guard let newItem = readLine() else {
                print("Invalid input for Add operation")
                continue
            }
            addItem(cart: &shoppingCart, newItem: newItem)
        case "R":
            print("Enter item name:")
            guard let itemToRemove = readLine() else {
                print("Invalid input for Remove operation")
                continue
            }
            shoppingCart = removeItem(cart: shoppingCart, itemToRemove: itemToRemove)
        case "Q":
            return
        default:
            print("Invalid option. Please enter A, R, or Q.")
        }
    }
}

startShopping()
