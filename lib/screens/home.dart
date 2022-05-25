import 'package:app/cubit/cubits/CubitsApp.dart';
import 'package:app/cubit/states/StatesApp.dart';
import 'package:app/syles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePage extends StatelessWidget {
  HomePage({
    required this.uid,
    Key? key,
  }) : super(key: key);

  final String uid;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CubitApp(),
        ),
        BlocProvider(
          create: (_) => CubitApp()..getData(uid),
        ),
      ],
      child: BlocConsumer<CubitApp, AppStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = CubitApp.get(context);
          return Scaffold(

            appBar: AppBar(
              title: Text(cubit.Titels[cubit.CerrentInex]),

            ),
            body: cubit.screens[cubit.CerrentInex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: second,
              currentIndex: cubit.CerrentInex,
              onTap: (index) {
                cubit.ChangeButtomNav(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  label: 'profile',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
