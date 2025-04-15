
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key, required this.title, required this.onTap,
  });
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0,right: 16.0),
      child: Row(
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 12, color: Colors.black,fontWeight: FontWeight.w500)),
          Spacer(),
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Text("See All",style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 12,color: Colors.blue)),
                Icon(Icons.arrow_forward_ios_sharp,color: Colors.blue,size: 12,)
              ],
            ),
          )

        ],
      ),
    );
  }
}
