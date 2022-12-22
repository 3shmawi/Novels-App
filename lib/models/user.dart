class UserModel {
  final String id;
  final String name;
  final String email;
  final String imgUrl;
  final String token;
  final bool isAdmin;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.imgUrl,
    required this.token,
    required this.isAdmin,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'imgUrl': imgUrl,
      'token': token,
      'isAdmin': isAdmin,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      id: documentId,
      name: map['name'] as String,
      email: map['email'] as String,
      imgUrl: map['imgUrl'] as String,
      token: map['token'] as String,
      isAdmin: map['isAdmin'] as bool,
    );
  }

}
