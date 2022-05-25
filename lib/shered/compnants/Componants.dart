import 'package:app/syles/Colors.dart';
import 'package:flutter/material.dart';

Widget DefultButton({
  required double width ,
  required Color backgraound ,
  required  String? Function()? function ,
  required String text,
  double radios = 0.0,
  Widget? controller ,
}) => Container(
  width: width,
  child: MaterialButton(
    onPressed: function,
    child: Text(
      text.toUpperCase(),
      style: TextStyle(
        color: first,
      ),
    ),

  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(
      radios,
    ),
    color:second,

  ),
);
Widget defaultTextButton({
  required String? Function()? function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );

Widget defultFeiled({
  required TextEditingController controller,
  required TextInputType textInputType,
  required String? Function(String?) validate,
  bool hidpassword = false,
  Function(void)? onSubmit ,
  Function(void)? onChange ,
  Function()? onTap ,
  required String label,
  required IconData preiconData,
  Function()? suffixfun,
  IconData? suffixiconData,
}) =>    TextFormField(

  controller: controller,
  keyboardType: textInputType,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  validator:  validate,
  onTap: onTap,
  obscureText: hidpassword ,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(
      preiconData ,
      color: second,
    ),
    suffixIcon: suffixiconData !=null ?  IconButton(
      onPressed: suffixfun,
      icon: Icon(
        suffixiconData ,
        color: second,
      ),
    ) : null ,
  ),
);
Widget DrawerItem({
required String text ,
required  Function(void)? navigate(),
required IconData iconData

}) =>
Material(
child:   InkWell(
onTap: navigate,
child: Padding(
padding: EdgeInsets.all(10),
child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Padding(
padding: const EdgeInsets.all(10.0),
child: Icon(
iconData ,
color: second,
),

),

Padding(

padding: const EdgeInsets.all(10.0),

child: Text(
text,
style: TextStyle(
fontSize: 20,
color: second
),
),

)



],

),

),

),
);
OnBordingItem(
{
required String text ,
required  Function(void)? navigate(),
}
)=> InkWell(
onTap: navigate,
child: Padding(
padding: EdgeInsets.all(10.0),
child: Text(
text,
style: TextStyle(

),
),
),
);
DefultAppBar({
  required String text,
  IconData ?iconData,
  List<Widget>? actions ,

}) => AppBar(
  title: Text(text),
);
DefultTextBotton({
required  Function(void)? onPressed(),
required String text
})=> TextButton(onPressed: onPressed,
child: Text(
text
));
void navigateAndFinish(context,Widget)=>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context)=>Widget),
            (route) => false);

void navigateAndBack(context,Widget)=>
    Navigator.push(context,
      MaterialPageRoute(builder: (context)=>Widget),
    );




