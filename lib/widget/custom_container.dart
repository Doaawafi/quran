import 'package:flutter/material.dart';
class CustomContainer extends StatelessWidget {
   const CustomContainer(
      {Key? key,
      required this.image,
      required this.title,
      required this.color,
      required this.onpressed,
      required this.style,
      required this.fun,
      required this.subTitle})
      : super(key: key);

  final String image;
  final String title;
  final String subTitle;
  final Function() onpressed;
  final Color color;
  final TextStyle style;
  final Function() fun;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: onpressed,
        child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: const Offset(1.5, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(12)),
          child: Container(
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage(image),
                    width: 65,
                    height: 70,
                  ),
                  Flexible(
                    child: ListTile(
                      title:Text(title,style: style,) ,
                      subtitle: GestureDetector(
                         onTap: fun ,
                          child: Text(subTitle,style: TextStyle(color: Colors.black45,fontSize: 12),)),

                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
