import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  List<String> _nicknames = [];
  String _nickname = "";
  bool _isNicknameAvailable = false;
  String _nicknameAvailabilityMessage = "";
  bool _isNicknameChecked = false; // 중복 확인이 완료되었는지 여부를 추적하는 변수

  @override
  void initState() {
    super.initState();
    _loadNicknames();
    _nicknameController.addListener(() {
      setState(() {
        _nickname = _nicknameController.text;
        _updateNicknameValidation();
      });
    });
  }

  void _updateNicknameValidation() {
    final isValidLength = _nickname.length >= 2 && _nickname.length <= 10;
    final hasNoSpaces = !_nickname.contains(' ');

    setState(() {
      _isNicknameAvailable = isValidLength && hasNoSpaces;
      _nicknameAvailabilityMessage =
          isValidLength && hasNoSpaces ? "" : "닉네임은 2자에서 10자 사이로 입력해주세요";
    });
  }

  void _onCheckNickname() {
    final isAvailable = !_nicknames.contains(_nickname);
    setState(() {
      _isNicknameChecked = true; // 중복 확인이 완료되었다고 표시
      _isNicknameAvailable =
          isAvailable && _isNicknameAvailable; // 기존 조건과 함께 사용 가능 여부 업데이트
      _nicknameAvailabilityMessage =
          isAvailable ? "사용 가능한 닉네임입니다" : "이미 사용 중인 닉네임입니다";
    });
  }

  void _loadNicknames() async {
    final String response =
        await rootBundle.loadString('lib/data_manage/user_nickname.json');
    final data = json.decode(response);
    setState(() {
      _nicknames = List<String>.from(data["nicknames"]);
    });
  }

  void _onNextTap() {
    if (_nickname.isEmpty || !_isNicknameAvailable) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  String? _validateNickname(String? value) {
    if (value == null || value.isEmpty) {
      return '닉네임을 입력해주세요';
    }
    if (value.contains(' ')) {
      return '띄어쓰기 없이 입력해주세요';
    }
    if (value.length < 2 || value.length > 10) {
      return '닉네임은 2자에서 10자 사이로 입력해주세요';
    }
    if (_nicknames.contains(value)) {
      return '이미 사용 중인 닉네임입니다';
    }
    return null;
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
          child: Form(
            key: _formKey,
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
                TextFormField(
                  controller: _nicknameController,
                  decoration: InputDecoration(
                    hintText: "닉네임을 입력해주세요",
                    contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                    suffixIcon: Align(
                      alignment: Alignment.centerRight,
                      widthFactor: 1.0,
                      child: GestureDetector(
                        onTap: _onCheckNickname,
                        child: Container(
                          width: Sizes.size72,
                          height: Sizes.size35,
                          decoration: ShapeDecoration(
                            color: _nickname.isEmpty
                                ? AppColors.g2
                                : AppColors.bluedark,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '중복 확인',
                              style: AppTextStyles.btn1
                                  .copyWith(color: AppColors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  validator: _validateNickname,
                ),
                if (_nickname.isNotEmpty) // 닉네임 입력 중 메시지 표시
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _nicknameAvailabilityMessage,
                      style: AppTextStyles.caption.copyWith(
                        color: _isNicknameAvailable
                            ? AppColors.blue
                            : AppColors.activered,
                      ),
                    ),
                  ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 72),
                  child: GestureDetector(
                    onTap: _isNicknameAvailable && _isNicknameChecked
                        ? _onNextTap
                        : null,
                    child: NextContained(
                      text: "다음",
                      disabled: !_isNicknameAvailable || !_isNicknameChecked,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}