class UsuarioObj{

  var id;
  var nome;
  var email;
  var token;

  UsuarioObj({required Map json}){
    fromJson(json);
  }

  fromJson(json){
    nome = json['user_name'].toString() == 'null' ? '' : json['user_name'].toString();
    email = json['user_email'].toString() == 'null' ? '' : json['user_email'].toString();
    token = json['token'].toString() == 'null' ? '' : json['token'].toString();
    id = json['id'].toString() == 'null' ? '' : json['id'].toString();

  }
}