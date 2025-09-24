import 'dart:io';

int longestSubarray(List<int> nums) {
  int lastZero = -1;
  int left = 0;
  int maxLen = 0;

  for (int i = 0; i < nums.length; i++) {
    if (nums[i] == 0) {
      left = lastZero + 1;
      lastZero = i;
    }
    maxLen = (i - left).clamp(maxLen, i - left);
  }

  return maxLen;
}

void main() {
  print('Enter a list of numbers 0s and 1s separated by spaces:');
  String? input = stdin.readLineSync();
  if (input == null || input.isEmpty) {
    print('No input provided.');
    return;
  }
  List<int> nums = input.split(' ').map(int.parse).toList();
  int result = longestSubarray(nums);
  print('Length of the longest subarray after deleting one element: $result');
}
