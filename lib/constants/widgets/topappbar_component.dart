import 'package:flutter/material.dart';
import 'package:starting_block/constants/constants.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    required this.newAlarm,
  }) : super(key: key);

  final bool newAlarm;

  @override
  Size get preferredSize => const Size.fromHeight(56); // PreferredSize 값을 정의.

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 12,
      ),
      child: AppBar(
        leading: Transform.scale(
          scale: 0.5,
          alignment: Alignment.centerLeft,
          child: Image(image: AppImages.topapplogo),
        ),
        actions: <Widget>[
          SizedBox(
            height: 48,
            width: 48,
            child: Image(
              image: !newAlarm
                  ? AppImages.notification_inactived
                  : AppImages.notification_actived,
            ),
          ),
        ],
      ),
    );
  }
}

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56); // AppBar의 선호되는 높이 설정

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 12,
      ),
      child: AppBar(
        actions: <Widget>[
          SizedBox(
            height: 48,
            width: 48,
            child: Image(image: AppImages.settings),
          ),
        ],
      ),
    );
  }
}
