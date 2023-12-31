// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:starting_block/constants/constants.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    required this.newAlarm,
  }) : super(key: key);

  final bool newAlarm;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 12,
      ),
      child: AppBar(
        leading: Transform.scale(
          scale: 0.625,
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
  Size get preferredSize => const Size.fromHeight(56);

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

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

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
            child: Image(image: AppImages.search),
          ),
        ],
      ),
    );
  }
}

class BackAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image(
        image: AppImages.back,
      ),
    );
  }
}

class CloseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CloseAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56);

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
            child: Image(image: AppImages.close24),
          ),
        ],
      ),
    );
  }
}

class SaveAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SaveAppBar({
    Key? key,
    required this.isSaved,
  }) : super(key: key);

  final bool isSaved;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 12,
      ),
      child: AppBar(
        leading: Image(image: AppImages.back),
        actions: <Widget>[
          SizedBox(
            height: 48,
            width: 48,
            child: Image(
                image: isSaved
                    ? AppImages.bookmark_actived
                    : AppImages.bookmark_inactived),
          ),
        ],
      ),
    );
  }
}

class BackTitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackTitleAppBar({
    Key? key,
    this.thisTextStyle,
    required this.text,
    this.onPress,
  }) : super(key: key);

  final thisTextStyle;
  final String text;
  final onPress;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image(image: AppImages.back),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: TextButton(
            onPressed: () {
              onPress;
            },
            child: Text(text, style: thisTextStyle),
          ),
        ),
      ],
    );
  }
}
