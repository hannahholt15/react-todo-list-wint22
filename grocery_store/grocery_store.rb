#Display a menu in the console for the user to interact with.
#Create a default array of hashes that represent items at a grocery store.
#Create a menu option to add items to a user's grocery cart.
#Create a menu option to display all the items in the cart.
#Create a menu option to remove an item from the users cart.
#Create a menu option to show the total cost of all the items in the user's cart.
#Add new items to the grocery store.

@user_cart = [{food: '', price: 0.00}]
@grocery_store = [
  {food: 'chocolate', price: 1.99},
  {food: 'grapes', price: 2.99},
  {food: 'bread', price: 3.99},
  {food: 'eggs', price: 4.99},
  {food: 'drinks', price: 5.99},
  {food: 'brisket', price: 50.99}
]
@user_money = 49.99
@tax_percentage = 0.08

def seperator
  puts "*" * 10
  puts
end

def menu
  seperator
  puts "Welcome to the $49.99 Budget grocery store"
  puts "Please Make A Selection:"
  puts "1) View Grocery Store Items"
  puts "2) Add Items to your cart"
  puts "3) View Cart"
  puts "4) Remove Items from your cart"
  puts "5) Checkout"
  puts "6) Add Items to the grocery store"
  puts "7) Exit"
end

def user_selection
  choice = gets.strip.to_i
  case choice
  when 1
    view_grocery_store
    menu
  when 2
    add_items
  when 3
    view_cart
    menu
  when 4
    remove_items
  when 5
    checkout
  when 6
    add_items_to_store
  when 7
    puts "Goodbye!"
    puts
    exit
  else
    puts "Invalid Option, Please Try Again"
  end

  user_selection
end

def view_grocery_store
  @grocery_store.each do |item|
    puts "--------"
    puts "Name: #{item[:food]}"
    puts "Price: $#{item[:price]}"
  end
  puts
end

#Known bug: adding invalid items (without valid price) to carts is allowed
def add_items
  view_grocery_store
  cart_food = ''
  cart_price = ''

  puts "Select an item to add to your cart: "
  user_input = gets.strip.to_s
  puts

  @grocery_store.each do |item|
    if user_input == item[:food]
      cart_price = item[:price]
      cart_food = item[:food]
      break
    else
      #skips current item, moves to next item
    end
  end

  new_item = {food: cart_food, price: cart_price}

  @user_cart << new_item

  menu
end

def view_cart
  seperator
  puts "Your Current Cart - "
  @user_cart.each do |item|
    if item[:food] == ''
      #do nothing
    else
      puts "--------"
      puts "Name: #{item[:food]}"
      puts "Price: $#{item[:price]}"
    end
  end
  puts
end

def remove_items
  view_cart

  puts "Enter the item to remove: "
  item_input = gets.strip.to_s

  @user_cart.delete_if { |item| item[:food] == item_input}

  menu
end

def checkout
  cart_total = 0.00
  total_price = 0.00
  taxes = 0.00

  @user_cart.each do |item|
    cart_total += item[:price]
  end

  taxes = cart_total * @tax_percentage
  total_price = taxes + cart_total

  seperator
  puts "Current User Money: $" + @user_money.round(2).to_s
  puts "Cart Total: $" + cart_total.round(2).to_s
  puts "Taxes: $" + taxes.round(2).to_s
  puts

  seperator
  puts "Proceed to checkout? Yes/No?"
  user_input = gets.strip.downcase.to_s

  case user_input
  when 'yes'
    if @user_money >= total_price
      @user_money -= total_price
      seperator
      puts "Successful Checkout... "
      puts "Remaining User Money: $" + @user_money.round(2).to_s

      @user_cart.delete_if { |item| item[:food] == item[:food]}
    else
      puts "Insufficient Funds. Please Remove Items...  "
    end
  else
  end
  puts 
  puts "Returning to Menu... "
  puts

  menu
end

def add_items_to_store
  puts "Enter the item to add: "
  item_input = gets.strip.to_s
  puts "Enter the price: "
  price_input = gets.strip.to_f

  new_item = {food: item_input, price: price_input}

  @grocery_store << new_item

  menu
end

menu
user_selection