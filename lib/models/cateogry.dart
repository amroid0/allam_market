class CateogryModel{
  String name;
  String url;

  CateogryModel({this.name, this.url});
  CateogryModel.fromJson(Map<dynamic,dynamic>map){
    if(map==null)return;
    name=map['name'];

    url=map['url'];

  }
  toJson(){
    return {
      'name':name,
      'url':url
    };
  }
}