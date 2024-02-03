import 'package:flutter/material.dart';

class ActionCardMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Function() onPressed;
  final bool _disabled;
  const ActionCardMenu(
      {super.key,
      required this.title,
      required this.icon,
      required this.color,
      required this.onPressed,
      bool disabled = false}) : _disabled = disabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      width: 100.0,
      child: Card(
        
        color:  _disabled ? Colors.grey : color,
        child: InkWell(
          
          onTap:  _disabled ? null : onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
              ),
              Text(title)
              
            ]
          )
        )
      ),
    );
  }
}
