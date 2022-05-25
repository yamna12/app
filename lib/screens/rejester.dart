import 'package:app/cubit/cubits/CubitLogin.dart';
import 'package:app/cubit/cubits/Cubit_Regester.dart';
import 'package:app/cubit/states/StatesRegester.dart';
import 'package:app/cubit/states/statesLogin.dart';
import 'package:app/screens/home.dart';
import 'package:app/shered/compnants/Componants.dart';
import 'package:app/shered/local/Cash_Helper.dart';
import 'package:app/syles/Colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Regester extends StatelessWidget {
  var fnameController = TextEditingController();
  var lnameController = TextEditingController();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var emailRegExp = RegExp("[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  var formkey = GlobalKey<FormState>();
  bool ispassword = true;

  bool keyChek = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ResgesterCubit(),
      child: BlocConsumer<ResgesterCubit, RegesterStates>(
        listener: (context, state) {
          if (state is CreateUserSucessState) {
            print("create users is sucsseful");
                  navigateAndFinish(context, HomePage(uid: 'uid'));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              color: first,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rgester',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: second,
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          defultFeiled(
                            controller: fnameController,
                            textInputType: TextInputType.emailAddress,
                            preiconData: Icons.perm_identity_outlined,
                            label: " first name ",
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return ("first name must be empty");
                              }

                              return null;
                            },
                          ),
                          defultFeiled(
                            controller: lnameController,
                            textInputType: TextInputType.emailAddress,
                            preiconData: Icons.email,
                            label: " last name ",
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return ("last name must be empty");
                              }

                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          defultFeiled(
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,
                            preiconData: Icons.email,
                            label: " email ",
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return ("Password must be empty");
                              }

                              return null;
                            },
                          ),
                          SizedBox(
                            //bach ndiro blassa khawya
                            height: 15.0,
                          ),
                          defultFeiled(
                            controller: passwordController,
                            textInputType: TextInputType.visiblePassword,
                            preiconData: Icons.lock,
                            hidpassword: ispassword,
                            suffixiconData: ispassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            label: "Password ",
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return ("Password must be empty");
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          ConditionalBuilder(
                              condition: state is! LoginLaodingState,
                              builder: (context) {
                                return DefultButton(
                                  text: "se connecter",
                                  radios: 15,
                                  width: double.infinity,
                                  backgraound: first,
                                  function: () {
                                    if (formkey.currentState!.validate()) {
                                      ResgesterCubit.get(context).AddUser(
                                        nom: fnameController.text,
                                        prenom: lnameController.text,

                                          email: emailController.text,
                                          password: passwordController.text,);
                                    }
                                  },
                                );
                              },
                              fallback: (context) =>
                                  Center(child: CircularProgressIndicator())),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
