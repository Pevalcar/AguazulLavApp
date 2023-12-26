import 'package:flutter/material.dart';

class ActionCardMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Function() onPressed;
  const ActionCardMenu(
      {super.key,
      required this.title,
      required this.icon,
      required this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      width: 100.0,
      child: Card(
        
        color: color,
        child: InkWell(
          
          onTap: onPressed,
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
