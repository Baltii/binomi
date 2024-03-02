import 'package:flutter/material.dart';
import 'package:binomi/features/profile/widget/app_bar_settings.dart';
import 'package:binomi/shared/bottom_nav_bar.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  int selectedIndex = 0;
  bool? isSelectedEnglish = false; // Variable pour l'anglais
  bool? isSelectedFrench = false; // Variable pour le français

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const AppBarSettings(),
          const SizedBox(height: 30),
           const Text('Languages',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 40),
          _buildContainer([
            const Text('Suggested',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            _buildRowInformation(
              'English',
              isSelectedEnglish ?? false,
              (value) {
                setState(() {
                  isSelectedEnglish = value;
                  isSelectedFrench = value == true ? false : null;
                });
              },
            ),
            _buildRowInformation(
              'French',
              isSelectedFrench ?? false,
              (value) {
                setState(() {
                  isSelectedFrench = value;
                  isSelectedEnglish = value == true ? false : null;
                });
              },
            ),
          ]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        onIndexChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildContainer(List<Widget> children) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget _buildRowInformation(
    String content,
    bool value,
    void Function(bool?)? onChanged,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            content,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.visible,
            maxLines: null,
          ),
        ),
        Radio(
          value: true,
          activeColor : Colors.lightBlueAccent,
          groupValue: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
