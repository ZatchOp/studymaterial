import 'package:flutter/material.dart';

/*
S — Single Responsibility Principle (SRP)
A class should have only one reason to change.

Each class should do one thing and do it well.

Example: Don’t mix business logic with database code in one class.



💡 Definition:
"A class (or component) should have only one reason to change."

This means each class or function should only do one thing — whether it's UI rendering, business logic, data handling, etc.

✅ In a Frontend context :
You want to separate:

UI rendering

Data fetching

State management

Event handling


*/
class User{
String? userName;
String? userEmail;

User({this.userName,this.userEmail});
}

  User fetchUser() {
    // Simulate API call
    return User(userName: 'Shubham', userEmail: 'shubham@example.com');
  }

//  Example: Flutter (Bad Practice)
class UserProfileBad extends StatelessWidget {
 const UserProfileBad({super.key});
  @override
  Widget build(BuildContext context) {
    // Fetching data, building UI, and parsing response – all in one place
    final user = fetchUser(); // ❌ Not SRP
    return Column(
      children: [
        Text(user.userName??"N/A"),
        Text(user.userEmail??"N/A"),
      ],
    );
  }

}



// SRP-compliant version:

// Separate responsibility: fetching logic
class UserService {
  User fetchUser() {
    return User(userName: 'Shubham', userEmail: 'shubham@example.com');
  }
}


// Separate UI
class UserProfileGood extends StatelessWidget {
   UserProfileGood({super.key});

 final User user = User();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(user.userName??""),
        Text(user.userEmail??""),
      ],
    );
  }
}
