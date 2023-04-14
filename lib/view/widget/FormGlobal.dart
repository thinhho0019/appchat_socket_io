import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FormGlobal extends StatefulWidget {
  FormGlobal(
      {super.key,
      required this.controller,
      required this.text,
      required this.textInputType,
      required this.obscure});
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;

  @override
  State<FormGlobal> createState() => _FormGlobalState();
}

class _FormGlobalState extends State<FormGlobal> {
  bool ShowPass = true;

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
                controller: widget.controller,
                keyboardType: widget.textInputType,
                obscureText: widget.obscure ? ShowPass : widget.obscure,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  hintText: widget.text,
                  suffixIcon: widget.obscure
                      ? IconButton(
                          alignment: Alignment.center,
                          iconSize: 20,
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            ShowPass ? Icons.visibility : Icons.visibility_off,
                            color: Theme.of(context).primaryColorDark,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable

                            setState(() {
                              ShowPass ? ShowPass = false : ShowPass = true;
                            });
                          },
                        )
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
