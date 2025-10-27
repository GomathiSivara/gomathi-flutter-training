import 'dart:collection';

void main() {
  List<int> nums = [-1, 0, 1, 2, -1, -4];
  print(threeSum(nums));
}

List<List<int>> threeSum(List<int> nums) {
  nums.sort();
  Set<String> seen = {};
  List<List<int>> result = [];
  int n = nums.length;

  for (int i = 0; i < n - 2; i++) {
    if (i > 0 && nums[i] == nums[i - 1]) continue;

    int left = i + 1;
    int right = n - 1;

    while (left < right) {
      int sum = nums[i] + nums[left] + nums[right];

      if (sum == 0) {
        List<int> triplet = [nums[i], nums[left], nums[right]];
        String key = triplet.join(",");
        if (!seen.contains(key)) {
          seen.add(key);
          result.add(triplet);
        }
        left++;
        right--;

        while (left < right && nums[left] == nums[left - 1]) left++;
        while (left < right && nums[right] == nums[right + 1]) right--;
      } else if (sum < 0) {
        left++;
      } else {
        right--;
      }
    }
  }

  return result;
}
