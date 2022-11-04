class PetsAPI {
  Future<List<Map<String, String>>> getRawPets() {
    var future = Future.delayed(
        const Duration(seconds: 2),
        () => [
              {'name': 'Atos', 'breed': 'York Shire'},
              {'name': 'Panko', 'breed': 'Shiba'},
              {'name': 'Cleo', 'breed': 'Pomeranian'},
              {'name': 'Max'},
            ]);
    return future;
  }
}
