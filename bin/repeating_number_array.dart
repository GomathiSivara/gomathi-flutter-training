import 'dart:io';

void main() {
  String? numberString = stdin.readLineSync();
  Map<int, List<int>> values = {};
  List<int> finalArray = [];

  if(numberString == null || (numberString.isEmpty)){
    finalArray = [-1,-1];
    return;
  }

  List<int> numbers = numberString.split(',').toList().map((e)=>int.parse(e)).toList();

  for (int i = 0; i < numbers.length; i++) {
    for (int j = i + 1; j < numbers.length; j++) {
      if (numbers[i] == numbers[j]) {
        values[numbers[i]] = [i, j];
        break;
      }
    }
  }

  int minSecondIndex = numbers.length;
  int resultKey = -1;

  if(values.isNotEmpty){
    values.forEach((key, pos) {
      if (pos[1] < minSecondIndex) {
        minSecondIndex = pos[1];
        resultKey = key;
      }
    });

    finalArray.add(resultKey);
    finalArray.add(minSecondIndex);
  }
  if(finalArray.isEmpty){
    finalArray.addAll([-1,-1]);
  }

  print(finalArray);
}
