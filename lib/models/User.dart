class UserModel{
  String userId,email,name,pic;

  UserModel({this.userId, this.email, this.name, this.pic});
  UserModel.fromJson(Map<dynamic,dynamic>map){
    if(map==null)return;
       this.userId=map['userId'];
    this.email=map['email'];
    this.name=map['name'];
    this.pic=map['pic'];
  }
  toJson(){
    return {
      'userId':userId,
      'email':email,
      'name':name,
      'pic':pic
    };
  }


}