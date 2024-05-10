class UserModel{
  String? name;
  String? email;
  String? phone;


  // Constructor
  UserModel(this.name,this.email);

  // Named constructor
  UserModel.fromJson({required Map<String,dynamic> data}){
    // Refactoring Map | Json
    name = data['users']['name'];
    email = data['users']['email'];
    phone = data['users']['phone'];
  }

  // To Map
  Map<String,dynamic> toMap(){
    return {
      'name' : name,
      'email' : email,
      'phone' : phone,
    };
  }

}