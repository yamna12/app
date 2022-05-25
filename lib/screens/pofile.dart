import 'package:app/cubit/cubits/CubitsApp.dart';
import 'package:app/cubit/states/StatesApp.dart';
import 'package:app/syles/Colors.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Profile extends StatelessWidget {
  const Profile({required this.uid,
    Key? key,
  }) : super(key: key);
  final String uid;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CubitApp()..getData(uid),

      child: BlocConsumer<CubitApp, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {

          var model = CubitApp.get(context).model;
          return ConditionalBuilder(
            condition: (model != null),
            builder: (BuildContext context)
            {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: first,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                        child: Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              Align(
                                alignment: AlignmentDirectional.topCenter,
                                child: Container(
                                  height: 160.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0)),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          model!.cover),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).scaffoldBackgroundColor,
                                ),
                                child: CircleAvatar(
                                  radius: 70,
                                  backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundImage:
                                    NetworkImage(model.image),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('${model.nom + "" + model.prenom}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: const Text('Ajouter une photo'),
                                )),
                            OutlinedButton(
                              onPressed: () {
                              },
                              child: const Icon(
                                FontAwesomeIcons.userPen,
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },

            fallback: (context) => Center(child: CircularProgressIndicator()),
          );

        },
      ),
    );
  }

}
