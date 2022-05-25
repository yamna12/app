class   UserClassM{
  late String uid;
  late String nom;
  late String prenom;
  late String email;
  late String image;
  late String cover;
  UserClassM({
    required this.uid ,
    required this.nom ,
    required this.prenom ,
    required this.email,
    required this.image,
    required this.cover,

  });
  UserClassM.fromJson(Map<String ,dynamic > json){
    uid = json['uid'];
    nom = json['nom'];
    prenom = json['prénom'];
    email = json['email'];
    image = json['image'];
    cover = json['cover'];

  }
  Map<String , dynamic>Tomap1() =>{
    'uid' : uid ,
    'nom' : nom ,
    'prénom' : prenom ,
    'email' : email,
    'image' : image,
    'cover' : cover,

  };

}