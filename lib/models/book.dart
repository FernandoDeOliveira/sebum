class Book {
  String _title;
  String _author;
  String _ISBN;
  String _photo_url;
  List<dynamic> _usersOwningTheBooks;

  dataLikeJson () => {
    'title': _title,
    'author': _author,
    'photo_url': _photo_url,
    'ISBN': _ISBN,
    'usersOwningTheBooks': _usersOwningTheBooks
  };

  List<dynamic> get usersOwningTheBooks => _usersOwningTheBooks;

  set usersOwningTheBooks(List<dynamic> value){
    _usersOwningTheBooks = value;
  }

  String get photo_url => _photo_url;

  set photo_url(String value) {
    _photo_url = value;
  }

  String get ISBN => _ISBN;

  set ISBN(String value) {
    _ISBN = value;
  }

  String get author => _author;

  set author(String value) {
    _author = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  fromMap(Map<String, dynamic> data){
    this.author = data['author'];
    this.photo_url = data['photo_url'];
    this.title = data['title'];
    this.usersOwningTheBooks = data['usersOwningTheBooks'];
    this.ISBN = data['ISBN'];

  }
  

}
