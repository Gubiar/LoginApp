import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_app/screens/PageHome.dart';

import '../controller/Controller.dart';

class PageLogin extends StatelessWidget {

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _repetirSenhaController = TextEditingController();
  final _nome = TextEditingController();
  bool isLogin = true;
  bool isObscure = true;
  bool isAsync = false;

  PageLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size _windowsSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: _windowsSize.width,
            height: _windowsSize.height,
            child: StatefulBuilder(
              builder: (BuildContext context, setStateLocal) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SvgPicture.asset(
                    'assets/login.svg',
                    width: _windowsSize.width * 0.5,
                    fit: BoxFit.contain,
                  ),

                  //Toggle buttons
                  Container(
                    width: _windowsSize.width * 0.9,
                    height: 45,
                    margin: const EdgeInsets.only(
                        top: 40,
                        bottom: 20
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff5E548E).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        InkWell(
                          onTap: () {
                            if(!isAsync){
                              setStateLocal((){
                                FocusScope.of(context).unfocus();
                                isLogin = true;
                                isObscure = true;
                              });
                            }
                          },
                          child: Container(
                            width: _windowsSize.width * 0.45,
                            height: 45,
                            decoration: BoxDecoration(
                                color: isLogin ? const Color(0xff9F86C0) : Colors.transparent,
                                borderRadius: BorderRadius.circular(6)
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: isLogin ? Colors.white : const Color(0xff231942),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: () {
                            if(!isAsync){
                              setStateLocal((){
                                FocusScope.of(context).unfocus();
                                isLogin = false;
                                isObscure = true;
                              });
                            }
                          },
                          child: Container(
                            width: _windowsSize.width * 0.45,
                            height: 45,
                            decoration: BoxDecoration(
                                color: !isLogin ? const Color(0xff9F86C0) : Colors.transparent,
                                borderRadius: BorderRadius.circular(6)
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: !isLogin ? Colors.white : const Color(0xff231942),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),

                  if(isLogin)
                    SizedBox(
                      width: _windowsSize.width * 0.9,
                      child: Column(
                        children: [

                          TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          StatefulBuilder(
                            builder: (BuildContext context, setStateObscure) => TextField(
                              controller: _senhaController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: isObscure,
                              decoration: InputDecoration(
                                  labelText: 'Senha',
                                  suffixIcon: IconButton(
                                      onPressed: (){
                                        isObscure = !isObscure;
                                        setStateObscure((){});
                                      },
                                      icon: Icon(
                                        isObscure ? Icons.visibility_off : Icons.visibility,
                                        size: 20,
                                        color: !isObscure ? const Color(0xff9F86C0) : Color(0xff231942),
                                      )
                                  )
                              ),
                            ),
                          )

                        ],
                      ),
                    ),

                  if(!isLogin)
                    SizedBox(
                      width: _windowsSize.width * 0.9,
                      child: Column(
                        children: [

                          TextField(
                            controller: _nome,
                            decoration: const InputDecoration(
                              labelText: 'Nome',
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          TextField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          StatefulBuilder(
                              builder: (BuildContext context, setStateObscure) => Column(
                                children: [

                                  TextField(
                                    controller: _senhaController,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: isObscure,
                                    decoration: InputDecoration(
                                        labelText: 'Senha',
                                        suffixIcon: IconButton(
                                            onPressed: (){
                                              isObscure = !isObscure;
                                              setStateObscure((){});
                                            },
                                            icon: Icon(
                                              isObscure ? Icons.visibility_off : Icons.visibility,
                                              size: 20,
                                              color: !isObscure ? const Color(0xff9F86C0) : Color(0xff231942),
                                            )
                                        )
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),

                                  TextField(
                                    controller: _repetirSenhaController,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: isObscure,
                                    decoration: InputDecoration(
                                        labelText: 'Repetir Senha',
                                        suffixIcon: IconButton(
                                            onPressed: (){
                                              isObscure = !isObscure;
                                              setStateObscure((){});
                                            },
                                            icon: Icon(
                                              isObscure ? Icons.visibility_off : Icons.visibility,
                                              size: 20,
                                              color: !isObscure ? const Color(0xff9F86C0) : Color(0xff231942),
                                            )
                                        )
                                    ),
                                  ),

                                ],
                              )
                          ),



                        ],
                      ),
                    ),

                  InkWell(
                    onTap: () async {

                      setStateLocal((){
                        isAsync = true;
                      });

                      if(isLogin){

                        if(_emailController.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Insira um email.'),
                            duration: const Duration(seconds: 2),
                          ));

                          setStateLocal((){
                            isAsync = false;
                          });
                        }else if(_senhaController.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Insira a senha.'),
                            duration: const Duration(seconds: 2),
                          ));

                          setStateLocal((){
                            isAsync = false;
                          });
                        }else{
                          String mapToSend = '{"email":"${_emailController.text}","password":"${_senhaController.text}"}';
                          String retorno = await Controller.postLogin(mapToSend);

                          if(retorno == 'true'){

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (BuildContext context) => PageHome()),
                                ModalRoute.withName('/PageHome')
                            );

                          }else if(retorno == 'catch'){

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Não possível realizar o login. Tente novamente mais tarde'),
                              duration: const Duration(seconds: 2),
                            ));

                            setStateLocal((){
                              isAsync = false;
                            });
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(retorno),
                              duration: const Duration(seconds: 2),
                            ));

                            setStateLocal((){
                              isAsync = false;
                            });
                          }
                        }

                      }else{

                        if(_emailController.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Insira um email.'),
                            duration: const Duration(seconds: 2),
                          ));

                          setStateLocal((){
                            isAsync = false;
                          });
                        }else if(_senhaController.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Insira a senha.'),
                            duration: const Duration(seconds: 2),
                          ));

                          setStateLocal((){
                            isAsync = false;
                          });
                        }else if(_repetirSenhaController.text.isEmpty || _senhaController.text != _repetirSenhaController.text ){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('As senhas não correspondem.'),
                            duration: const Duration(seconds: 2),
                          ));

                          setStateLocal((){
                            isAsync = false;
                          });
                        }else if(_nome.text.isEmpty){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('Insira um nome.'),
                            duration: const Duration(seconds: 2),
                          ));

                          setStateLocal((){
                            isAsync = false;
                          });
                        }else{

                          String mapToSend = '{"name":"${_nome.text}","email":"${_emailController.text}","password":"${_senhaController.text}","confirmPassword":"${_repetirSenhaController.text}"}';
                          String retorno = await Controller.postRegister(mapToSend);

                          if(retorno == 'true'){

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Usuário cadastrado com sucesso"),
                              duration: const Duration(seconds: 2),
                            ));

                            setStateLocal((){
                              isAsync = false;
                              isLogin = true;
                            });

                          }else if(retorno == 'catch'){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text('Não possível cadastrar o usuário. Tente novamente mais tarde'),
                              duration: const Duration(seconds: 2),
                            ));

                            setStateLocal((){
                              isAsync = false;
                            });
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(retorno),
                              duration: const Duration(seconds: 2),
                            ));

                            setStateLocal((){
                              isAsync = false;
                            });
                          }
                        }

                      }
                    },
                    child: Container(
                      width: _windowsSize.width * 0.9,
                      height: 50,
                      margin: const EdgeInsets.only(
                          top: 40
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xff9F86C0),
                      ),
                      child: isAsync
                          ? const SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                          : Text(
                        isLogin ? 'Login' : 'Register',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 17
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
