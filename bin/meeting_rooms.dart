int minMeetingRooms(List<List<int>> intervals) {
  if (intervals.isEmpty) return 0;

  List<int> starts = [];
  List<int> ends = [];

  for (var meeting in intervals) {
    starts.add(meeting[0]);
    ends.add(meeting[1]);
  }

  starts.sort();
  ends.sort();

  int rooms = 0;
  int endPtr = 0;

  for (int i = 0; i < starts.length; i++) {
    if (starts[i] < ends[endPtr]) {
      rooms++;
    } else {
      endPtr++;
    }
  }

  return rooms;
}

void main() {
  print(minMeetingRooms([[0, 30], [5, 10], [15, 20]])); // Output: 2
  print(minMeetingRooms([[7, 10], [2, 4]])); // Output: 1
  print(minMeetingRooms([[1, 4], [2, 5], [3, 6]])); // Output: 3
  print(minMeetingRooms([[1,10],[2,7],[3,19],[8,12],[10,20],[11,30]])); // Output: 4
}
