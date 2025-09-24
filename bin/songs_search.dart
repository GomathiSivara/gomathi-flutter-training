import 'dart:io';
import 'Model/songs.dart';

String normalize(String input) {
  return input.toLowerCase().replaceAll(RegExp(r'[^a-z0-9\s]'), '');
}

void main() {
  SongsList songsList = SongsList.fromJson(songsJson);

  print("keywords= ");
  String? userInput = stdin.readLineSync();

  print("year=");
  String? yearInString = stdin.readLineSync();

  if (userInput == null || userInput.trim().isEmpty) {
    print("No Songs Found");
    return;
  }

  List<String> keywords = userInput
      .split(',')
      .map((e) => normalize(e.trim()))
      .where((e) => e.isNotEmpty)
      .toList();

  int? yearValue;
  if (yearInString != null && yearInString.trim().isNotEmpty) {
    final value = int.tryParse(yearInString.trim());
    if (value != null && value >= 1900 && value <= 2025) {
      yearValue = value;
    }
  }

  List<SongData> results = [];

  for (var song in songsList.songs) {
    String title = normalize(song.title);
    String artist = normalize(song.artist);
    String genre = normalize(song.genre);

    bool keywordMatch = keywords.any((k) =>
    title.contains(k) || artist.contains(k) || genre.contains(k));

    bool yearMatch = (yearValue == null || song.year == yearValue);

    if (keywordMatch && yearMatch) {
      results.add(song);
    }
  }

  if (results.isEmpty) {
    print("No Songs Found");
  } else {
    for (var song in results) {
      printResult(song);
    }
  }
}

void printResult(SongData song) {
  print(
      "Title: ${song.title} | Artist: ${song.artist} | Genre: ${song.genre} | Year: ${song.year}");
}
