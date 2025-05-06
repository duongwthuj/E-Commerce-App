import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utlis/constants/colors.dart';
import '../../../utlis/constants/image_strings.dart';
import '../images/t_circular_image.dart';

class TUserProfileTitle extends StatelessWidget {
  const TUserProfileTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const TCircularImage(image: TImages.user, width: 50, height: 50, padding: 0,),
        title: Text('Fix Bug With DThuj', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white )),
        subtitle: Text('abcbcbcsbndfh', style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.white )),
        trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.edit, color: TColors.white))
    );
  }
}