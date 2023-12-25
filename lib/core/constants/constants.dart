class Urls {
  static const String rickAndMortyAPIBaseURL = "https://rickandmortyapi.com/api";
  static String characterById(String id) =>
      '$rickAndMortyAPIBaseURL/character/$id';
  static String allCharacters() => '$rickAndMortyAPIBaseURL/character';
}