class User{
  int id;
  String userName;
  String passwd;
  late DateTime createDate;

  User({required this.id, required this.userName, required this.passwd}){
    createDate = DateTime.now();
  }
}