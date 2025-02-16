class Produit {
  final int id;
  final String libelle;
  final double prix;
  final int qte;
  Produit({
    required this.id,
    required this.libelle,
    required this.prix,
    required this.qte,
  });
  factory Produit.fromJson(Map<String, dynamic> json){
    return Produit(
      id: json['id'],
      libelle: json['libelle'],
      prix: json['prix'],
      qte: json['qte'],
    );
  }
}
