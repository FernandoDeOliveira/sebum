class User {
  String photo_url;
  String id;
  String phone;
  String name;
  String email;

  fromMap(Map<String, dynamic> data){
    this.photo_url = data['photo_url'];
    this.id = data['id'];
    this.phone = data['phone'];
    this.name = data['name'];
    this.email = data['email'];
  }

}
