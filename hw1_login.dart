import 'dart:io';
void main() {
  String static_username = 'chou';
  String static_password = 'password123';

  // technically, can use print() instead of stdout, but print auto gives new line, and stdout just makes it easier to pair with stdin (easy to recognize as trying to retrieve input)
  stdout.write('Enter username: ');
  String username = stdin.readLineSync() ?? ''; // if no user input, put it as ''

  stdout.write('Enter password: ');
  String password = stdin.readLineSync() ?? '';

  if (username == static_username && password == static_password) {
    print('\nLogin successful!\n');
  } else {
    print('\nInvalid username or password.\n');
  }
}