import 'package:challenge_3/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String? title;

  const CustomCard ({super.key, required this.imageUrl,  this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 20,
      shadowColor: AppTheme.primaryColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: [
           FadeInImage(
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage('assets/jar-loading.gif'),
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 30),
          ),

          if (title != null)
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding:
                  const EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
              child: Text(title ?? 'No title'),
            )
        ],
      ),
    );
  }
}
