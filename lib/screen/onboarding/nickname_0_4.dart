import 'package:flutter/material.dart';
import 'package:starting_block/constants/constants.dart';
import 'package:starting_block/screen/manage/screen_manage.dart';

class NickNameScreen extends StatefulWidget {
  const NickNameScreen({super.key});

  @override
  State<NickNameScreen> createState() => _NickNameScreenState();
}

class _NickNameScreenState extends State<NickNameScreen> {
  final TextEditingController _nicknameController = TextEditingController();

  String _nickname = "";

  @override
  void initState() {
    super.initState();
    _nicknameController.addListener(() {
      setState(() {
        _nickname = _nicknameController.text;
      });
    });
  }

  void _onCheckNickname() {
    // 닉네임 중복 확인 로직 구현
  }

  void _onNextTap() {
    if (_nickname.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image(image: AppImages.back),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v12,
              const Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: Sizes.size8,
                    color: AppColors.blue,
                  ),
                  Gaps.h4,
                  Icon(
                    Icons.circle,
                    size: Sizes.size8,
                    color: AppColors.g2,
                  ),
                  Gaps.h4,
                  Icon(
                    Icons.circle,
                    size: Sizes.size8,
                    color: AppColors.g2,
                  ),
                  Gaps.h4,
                  Icon(
                    Icons.circle,
                    size: Sizes.size8,
                    color: AppColors.g2,
                  ),
                  Gaps.h4,
                  Icon(
                    Icons.circle,
                    size: Sizes.size8,
                    color: AppColors.g2,
                  ),
                  Gaps.h4,
                  Icon(
                    Icons.circle,
                    size: Sizes.size8,
                    color: AppColors.g2,
                  ),
                ],
              ),
              Gaps.v36,
              Text(
                "닉네임을 설정해 주세요",
                style: AppTextStyles.h5.copyWith(color: AppColors.g6),
              ),
              Gaps.v10,
              Text(
                "닉네임은 다른 사용자들에게 공개됩니다",
                style: AppTextStyles.bd6.copyWith(color: AppColors.g6),
              ),
              Gaps.v32,
              TextField(
                controller: _nicknameController,
                decoration: InputDecoration(
                  hintText: "닉네임을 입력해주세요",
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10.0), // 여기서 높이 조정
                  suffix: GestureDetector(
                    onTap: _onCheckNickname,
                    child: Container(
                      width: Sizes.size72,
                      height: Sizes.size35, // 이제 높이 설정이 적용될 것입니다.
                      decoration: ShapeDecoration(
                        color: AppColors.g2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '중복 확인',
                          style: AppTextStyles.btn1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 72),
                child: GestureDetector(
                  onTap: _onNextTap,
                  child: NextContained(
                    text: "다음",
                    disabled: _nickname.isEmpty,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
