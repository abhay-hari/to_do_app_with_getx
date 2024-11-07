import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class NoteTileWidget extends StatelessWidget {
  final Size size;
  final TextTheme text;
  final int index;
  final String? time, description;
  final Callback onPress;
  const NoteTileWidget({
    required this.size,
    required this.text,
    super.key,
    this.time,
    this.description,
    required this.onPress,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              height: double.infinity,
              width: size.width * 0.1,
              alignment: Alignment.center,
              color: Colors.red,
              child: Text(
                "${index + 1}",
                style: text.headlineSmall!.copyWith(color: Colors.white),
              ),
              // decoration:
              //     BoxDecoration(borderRadius: BorderRadius.circular(50)),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "$description",
                style: text.titleLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )),
            GestureDetector(
              onTap: onPress,
              child: Container(
                alignment: Alignment.center,
                height: double.maxFinite,
                width: size.width * 0.1,
                color: Colors.red,
                child: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
