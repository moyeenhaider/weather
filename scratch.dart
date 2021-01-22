import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String result = await task2();
  task3(result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

// void task2() {
//   Duration timeDelay = Duration(seconds: 3);
//   Future.delayed(timeDelay, () {
//     String result = 'task 2 data';
//     print('Task 2 complete');
//   });
// }

Future<String> task2() async {
  Duration timeDelay = Duration(seconds: 3);
  String result;
  await Future.delayed(timeDelay, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String result) {
  // String result = 'task 3 data';
  print('Task 3 complete with $result');
}
