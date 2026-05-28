import 'dart:io';

void main() {
  int emp_id = validate_int('Enter Employee ID: ');
  String emp_name = validate_string('Enter Employee Name: ');
  int hour = validate_int('Enter Working Hours: ');
  double rate = validate_double('Enter Rate/Hour (\$): ');

  double total = hour * rate * 4021;
  double net_total = calculate_net_total(total);

  print('\n========== Employee Profile ==========');
  print('ID:                    $emp_id');
  print('Name:                  $emp_name');
  print('Hour(s):               $hour');
  print('Rate/Hour:             \$${rate.toStringAsFixed(2)}/h'); // convert int/double to string with 2 deci places (like rounding up)
  print('Total (Before Tax):    \$${total.toStringAsFixed(2)}');
  print('Net Total (After Tax): \$${net_total.toStringAsFixed(2)}');
  print('======================================');
}

// +++++++++++++++++++++  FUNCTIONS  +++++++++++++++++++++

int validate_int(String message) {
  int value;
  while (true) {
    stdout.write(message);
    // dart doesn't take int as int, it takes it as ASCII (ex. input 5 and in returns 53)
    // so use readLineSync(String) to take user input as string, if no user input, place the value as '' / null
    // then use int.tryParse to convert string to int, if fails to convert (ex. user input 'abc'), then place num as -1
    value = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
    if (value > 0) {
      return value;
    }
    print('Error! Please enter a positive whole number!\n');
  }
}

String validate_string(String message) {
  String value;
  while (true) {
    stdout.write(message);
    value = stdin.readLineSync() ?? '';
    if (value != '') {
      return value;
    }
    print('Error! Please enter a valid string!\n');
  }
}

double validate_double(String message) {
  double value;
  while (true) {
    stdout.write(message);
    // user input as string first, then convert to double
    // if user didn't input any, value ''/null then if invalid input, value -1
    value = double.tryParse(stdin.readLineSync() ?? '') ?? -1;
    if (value > 0) {
      return value;
    }
    print('Error! Please enter a positive double!\n');
  }
}

double calculate_net_total(double total) {
  if (total >= 12500000) {
    return total - (total * 0.2);
  } else if (total >= 8500001) {
    return total - (total * 0.15);
  } else if (total >= 2000001) {
    return total - (total * 0.1);
  } else if (total >= 1500001) {
    return total - (total * 0.05);
  } else {
    return total;
  }
}