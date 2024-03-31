class User{
  User(this._name, this._email, {String? password}) : _password = password;
  String _name,_email;
  final String _imgAsset="assets/images/Profile_pic.png";
  String ?_password;
  List <User> _friends=[];
  String get name => _name;
  String get email => _email;
  String? get password => _password;
  String get imgAsset => _imgAsset;
  List <User> get friends => _friends;
  int get lenght=>_friends.length;
  set name(String value) {
    _name = value;
  }

  set email(String value) {
    _email = value;
  }
  set password(String? value) {
    _password = value;
  }
  void addFriend(User friend){
    _friends.add(friend);
  }
}