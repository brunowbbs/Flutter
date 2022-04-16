import 'package:flutter/material.dart';
import 'package:splash/services/prefs_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  //Fase do ciclo de vida, executado apos a montagem dos componentes
  @override
  void initState() {
    super.initState();

    //Future.delayed(const Duration(seconds: 3))
    //.then((value) => Navigator.of(context).pushReplacementNamed('/login'));

    //Criando lista de futures (promise.all)
    Future.wait([
      PrefsService.isAuth(),
      Future.delayed(const Duration(seconds: 3)),
    ]).then(
      (value) => value[0]
          ? Navigator.of(context).pushReplacementNamed('/home')
          : Navigator.of(context).pushReplacementNamed('/login'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );
  }
}
