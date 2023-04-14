

 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
 

class FormGlobalPassword extends StatefulWidget {
  FormGlobalPassword(
      {super.key,
      required this.controller,
      required this.text,
      required this.textInputType,
      required this.obscure});
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  bool obscure=false;
   
  @override
  State<FormGlobalPassword> createState() => _FormGlobalPasswordState();
}

class _FormGlobalPasswordState extends State<FormGlobalPassword> {
   
  
   

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 7,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
  obscureText: !widget.obscure,

  decoration: InputDecoration(
    hintText: widget.text,
    border: InputBorder.none,
    suffixIcon: IconButton(
      icon: Icon(
        widget.obscure ? Icons.visibility : Icons.visibility_off,
        color: Theme.of(context).primaryColorDark,
      ),
      onPressed: () {
        setState(() {
          widget.obscure = !widget.obscure;
        });
      },
    ),
  ),
),
            ),
          ),
        ],
      ),
    );
  }
}
