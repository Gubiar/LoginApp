import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:login_app/models/UsuarioObj.dart';

class Controller {

  static const bool DEV = true;
  static String url = 'https://server-gubiar.vercel.app/';
  static int resquestDurationSecondsTime = DEV ? 360 : 30;

  static UsuarioObj? usuariologado;


  static Future<String> postRegister(String mapToSend) async{

    log(mapToSend);

    try{
      http.Response response = await http.post(
        Uri.parse('${url}auth/register'),
        headers: {
          "Content-Type": "application/json",
          // "Authorization": usuarioLogado.token.toString().
          // HttpHeaders.authorizationHeader: 'Auth',
        },
        body: mapToSend,
      ).timeout(
          Duration(seconds: resquestDurationSecondsTime),
          onTimeout: () => http.Response(
            'timeout',
            408,
          )
      );

      Map jsonData = json.decode(response.body);

      if(jsonData['sucess'].toString() == 'true'){
        return 'true';
      }else{
        return jsonData['message'].toString();
      }

    } catch(e){
      debugPrint('catch - ${e.toString()}');
      return 'catch';
    }
  }

  static Future<String> postLogin(String mapToSend) async{

    log(mapToSend);

    try{
      http.Response response = await http.post(
        Uri.parse('${url}auth/login'),
        headers: {
          "Content-Type": "application/json",
          // "Authorization": usuarioLogado.token.toString().
          // HttpHeaders.authorizationHeader: 'Auth',
        },
        body: mapToSend,
      ).timeout(
          Duration(seconds: resquestDurationSecondsTime),
          onTimeout: () => http.Response(
            'timeout',
            408,
          )
      );

      Map jsonData = json.decode(response.body);
      if(DEV) log(jsonData.toString());

      if(jsonData['sucess'].toString() == 'true'){

        usuariologado = UsuarioObj(json: jsonData);
        return 'true';
      }else{
        return jsonData['message'].toString();
      }

    } catch(e){
      debugPrint('catch - ${e.toString()}');
      return 'catch';
    }
  }

  static Future<String> getUserPrivate(String mapToSend) async{

    log(mapToSend);

    try{
      http.Response response = await http.post(
        Uri.parse('${url}user/${usuariologado?.id.toString()}'),
        headers: {
          "Content-Type": "application/json",
          // "Authorization": usuarioLogado.token.toString().
          HttpHeaders.authorizationHeader: usuariologado?.token.toString() as String,
        },
        body: mapToSend,
      ).timeout(
          Duration(seconds: resquestDurationSecondsTime),
          onTimeout: () => http.Response(
            'timeout',
            408,
          )
      );

      Map jsonData = json.decode(response.body);
      if(DEV) log(jsonData.toString());

      if(jsonData['sucess'].toString() == 'true'){

        usuariologado = UsuarioObj(json: jsonData);
        return 'true';
      }else{
        return jsonData['message'].toString();
      }

    } catch(e){
      debugPrint('catch - ${e.toString()}');
      return 'catch';
    }
  }

}