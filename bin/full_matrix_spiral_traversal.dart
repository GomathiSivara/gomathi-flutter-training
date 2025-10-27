import 'dart:io';

void main() {
  List<String> dims = stdin.readLineSync()!.split(' ');
  int m = int.parse(dims[0]);
  int n = int.parse(dims[1]);

  List<List<int>> matrix = [];
  for (int i = 0; i < m; i++) {
    matrix.add(stdin.readLineSync()!.split(' ').map(int.parse).toList());
  }

  List<int> clockwise = spiralClockwise(matrix, m, n);
  List<int> anticlockwise = spiralAnticlockwise(matrix, m, n);

  print('Clockwise: ${clockwise.join(' ')}');
  print('Anticlockwise: ${anticlockwise.join(' ')}');
}

List<int> spiralClockwise(List<List<int>> matrix, int m, int n) {
  List<int> result = [];
  int top = 0, bottom = m - 1, left = 0, right = n - 1;

  while (top <= bottom && left <= right) {
    // Left → Right
    for (int i = left; i <= right; i++) result.add(matrix[top][i]);
    top++;

    // Top → Bottom
    for (int i = top; i <= bottom; i++) result.add(matrix[i][right]);
    right--;

    // Right → Left
    if (top <= bottom) {
      for (int i = right; i >= left; i--) result.add(matrix[bottom][i]);
      bottom--;
    }

    // Bottom → Top
    if (left <= right) {
      for (int i = bottom; i >= top; i--) result.add(matrix[i][left]);
      left++;
    }
  }

  return result;
}

// Anticlockwise spiral traversal
List<int> spiralAnticlockwise(List<List<int>> matrix, int m, int n) {
  List<int> result = [];
  int top = 0, bottom = m - 1, left = 0, right = n - 1;

  while (top <= bottom && left <= right) {
    // Top → Bottom
    for (int i = top; i <= bottom; i++) result.add(matrix[i][left]);
    left++;

    // Left → Right (bottom row)
    for (int i = left; i <= right; i++) result.add(matrix[bottom][i]);
    bottom--;

    // Bottom → Top (right column)
    if (left <= right) {
      for (int i = bottom; i >= top; i--) result.add(matrix[i][right]);
      right--;
    }

    // Right → Left (top row)
    if (top <= bottom) {
      for (int i = right; i >= left; i--) result.add(matrix[top][i]);
      top++;
    }
  }

  return result;
}
