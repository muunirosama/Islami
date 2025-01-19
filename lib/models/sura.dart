class Sura {
  final int id;
  final String nameEn;
  final String nameAr;
  final int verses;

  Sura({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.verses,
  });

  @override
  String toString() {
    return 'Sura(id: $id, nameEn: "$nameEn", nameAr: "$nameAr", verses: $verses)';
  }
}