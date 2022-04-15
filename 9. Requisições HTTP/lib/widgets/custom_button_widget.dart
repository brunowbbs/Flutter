
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget{
  final VoidCallback onPressed;
  final String title;
  final bool disabled;
  final double? titleSize;

  const CustomButtonWidget({
    Key? key, 
    required this.onPressed, 
    required this.title,
    this.titleSize,
    this.disabled = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled ? null : onPressed, 
      child: Text(title),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color>((states){
          if(states.contains(MaterialState.disabled)){
            return Colors.brown;
          }

          if(states.contains(MaterialState.pressed)){
            return Colors.blue;
          }

          return Colors.green;
        }),

        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          )
        ),

        /*textStyle: MaterialStateProperty.all(
          TextStyle(fontSize: titlesize)
        )*/
        textStyle: MaterialStateProperty.resolveWith((states){
          if(states.contains(MaterialState.pressed)){
            return  TextStyle(fontSize: titleSize != null ? titleSize! * 2 : 28);
          }
          return TextStyle(fontSize: titleSize);
        })
      ),
    );
  }

}