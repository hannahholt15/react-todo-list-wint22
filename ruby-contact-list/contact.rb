# sudo code, comment out the process, breaking up our objects 
# Basic Objectives

# Build a contact list
  # this is where we are listing out contacts and their info like phone email etc.
  # like the one on the phone 
# Create a menu that allows a user to select 1) Create a contact 2) View All Contacts 3) Exit
  # store all of our contacts 
  # datatype of what the contact is, what it has 
  # 1) Create a contact 
# inputs and outs of grabbing each value 
#  ex what is the new contact name 
#  ex what is the new contact phone number 
    # save the user input to a variable , need a variable for each attr
    # create a new contact with the variables in a object add to our collection
  # 2) View All Contacts 
    # go through the collection one by one 
    # display them in a reable way 
  # 3) Exit
    # say a good msg 
    # exit the program 
# The menu should loop until the user exits
  # loop 
  # recursion, calling a method within itself 

  # a way to store all contacts 

  # what does a contact have, attr? 
  contacts = [
    # what does a contact have, attr? 
    { name: 'bob', email: 'bob@email.com', phone: '123-123-1233' },
    { name: 'sue', email: 'sue@email.com', phone: '123-123-3333' },
    { name: 'jack', email: 'jack@email.com', phone: '123-123-1111' }
  ]
  def welcome
    puts "Hello welcome to the contact list"
  end
  
  def main_menu
    puts "Main menu"
    puts "1) Create a contact"
    puts "2) View All Contacts"
    puts "3) Exit"
    puts "What do you want to do?"
    user_input = gets.strip.to_i
    # p user_input
    # "1\n"
    # 1
    if user_input == 1
      puts "Create contact"
      create_contact
    elsif user_input == 2
      puts "View All Contacts"
      display_contacts
    elsif user_input == 3
      puts "Good bye"
      exit 
    else 
      puts "Error you need to type 1, 2, or 3"
      main_menu
    end
  end
  
  def create_contact
    puts "What is the new contacts name?"
    name_input = gets.strip
    puts "What is the new contacts email?"
    email_input = gets.strip
    puts "What is the new contacts phone?"
    phone_input = gets.strip
  
    # p name_input
    # p email_input
    # p phone_input
    new_contact = { name: name_input, email: email_input, phone: phone_input }
  
    @contacts << new_contact
  
    # p @contacts
  
    main_menu
  end
  
  def display_contacts
    # contact = { name: 'bob', email: 'bob@email.com', phone: '123-123-1233' },
  
    @contacts.each do |contact|
      puts "--------"
      puts "Name: #{contact[:name]}"
      puts "Email: #{contact[:email]}"
      puts "Phone: #{contact[:phone]}"
      puts 
    end
  
    main_menu
  end
  
  welcome
  main_menu