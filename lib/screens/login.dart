import 'package:app/cubit/cubits/CubitLogin.dart';
import 'package:app/cubit/states/statesLogin.dart';
import 'package:app/screens/home.dart';
import 'package:app/screens/rejester.dart';
import 'package:app/shered/compnants/Componants.dart';
import 'package:app/shered/local/Cash_Helper.dart';
import 'package:app/syles/Colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Conecter extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var emailRegExp = RegExp("[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  var formkey = GlobalKey<FormState>();
  bool ispassword = true;

  bool keyChek = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(LoginInisialState),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSucessState) {

            CashHelper.saveData(key:' uid', value: state.uid).then((value) {
              print(state.uid + ' this is uid');

              navigateAndFinish(context, HomePage(uid: 'uid'));
            });
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
                            'Login',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: second,
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          defultFeiled(
                            controller: emailController,
                            textInputType: TextInputType.emailAddress,
                            preiconData: Icons.email,
                            label: "  email ",
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return ("Email must be empty");
                              }

                              return null;
                            },
                          ),
                          SizedBox(
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
                            label: "Password",
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return (" Password must be empty");
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
                                      LoginCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  },
                                );
                              },
                              fallback: (context) =>

                                  Center(child: CircularProgressIndicator())),
                          SizedBox(
                            height: 30,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't Have an Account?",style: TextStyle(fontSize:15 ),),
                              defaultTextButton(
                                  function: (){navigateAndFinish(context, Regester());},
                                  text: 'Register')
                            ],),
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
