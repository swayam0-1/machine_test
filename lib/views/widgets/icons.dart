import 'package:flutter/material.dart';
class IconWidget extends StatefulWidget {
 final IconData icons;
 final Color color;
 final String txt;
  const IconWidget({super.key,
    required this.icons,
    required this.txt,
    required this.color});

  @override
  State<IconWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends State<IconWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:const BoxDecoration(

        ),
        child: Column(
          children: [Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(

              color:widget.color ,
              borderRadius: BorderRadius.circular(50),
            ),
            child:Icon(widget.icons,color: Colors.white,),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(widget.txt,style:const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),),
          )
          ],
        ),

    );
  }
}
