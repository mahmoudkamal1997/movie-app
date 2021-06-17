import 'package:flutter/material.dart';

Widget defaultTextField({controller,type,validate,label,prefixIcon= null,suffixIcon= null,obscureText= false,}){
  return TextFormField(
    controller: controller,
    keyboardType: type ,
    validator: validate,
    obscureText: obscureText,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    ),
  );
}

Widget defaultBotton({@required text,@required function,}){
  return  Container(
    width: double.infinity,

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.0),
      color: Colors.blue,
    ),
    child: MaterialButton(
      onPressed: function,
      child: Text('$text',style: TextStyle(fontSize:20,color: Colors.white,)),
    ),
  );
}

void NavigateTo(context, screen){
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}

void NavigateToAndReplacement(context, screen){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => screen));
}