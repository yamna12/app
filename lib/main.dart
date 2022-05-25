import 'package:app/cubit/cubits/CubitsApp.dart';
import 'package:app/firebase_options.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/login.dart';
import 'package:app/shered/constans/Constans.dart';
import 'package:app/shered/local/Cash_Helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';



Future main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CashHelper.init();

  uid = CashHelper.getData(key: 'uid') ?? '';
  print(uid);

  if (uid != '') {
    startWidget = HomePage(uid: uid!);
  } else {
    startWidget = Conecter();
  }
  runApp(MyApp(startWidget,uid)) ;
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  final String? uid;
  const MyApp(
      this.startWidget,
      this.uid,
      {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Provider(
          create: (_) => CubitApp()..getData(uid),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              home: startWidget,
            ),
        );


  }
}
