import 'package:flutter/material.dart';
import 'package:login_app/screens/PageLogin.dart';

import '../controller/Controller.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {

    Size windowsSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bora wess'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Text(
            'Bora wess',
            style: TextStyle(
                fontSize: 17,
                color: Colors.black87,
                fontWeight: FontWeight.w500
            ),
          ),

          const SizedBox(
            height: 30,
          ),

          InkWell(
            onTap: (){

              Controller.usuariologado = null;

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => PageLogin()),
                  ModalRoute.withName('/PageLogin')
              );
            },
            child: Container(
              width: windowsSize.width * 0.7,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xff9F86C0),
                borderRadius: BorderRadius.circular(6)
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [

                  Text(
                    'Sair',
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                    ),
                  ),

                ],
              ),
            ),
          ),

        ],
        )
      )
    );
  }
}
