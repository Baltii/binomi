import 'package:flutter/material.dart';

class BottomSheetFilter {
  static Set<int> selectedIndicesSortby = {};
  static Set<int> selectedIndicesType = {};
  static Set<int> selectedIndicesGender = {};
  static Set<int> selectedIndicesInclude = {};

  static final List<String> buttonSortby = [
    'Best Match',
    'Nearest',
    'Low Budget'
  ];
  static final List<String> buttonType = ['Apartment', 'House', 'All'];
  static final List<String> buttonGender = ['Female', 'Male'];
  static final List<String> buttonInclude = [
    'Wifi',
    'Garage',
    'Kitchen',
    'Shawer',
    'Clima',
    'Living room'
  ];

  static void show(BuildContext context, bool isSuccess) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: const Color(0xffFFFFFF),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              height: 800,
              width: 1000,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 13.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        _buildBoldText('Filter Place'),
                        const SizedBox(height: 30),
                        _buildBoldText('Sort by'),
                        const SizedBox(height: 15),
                        _buildButtonRow(
                            buttonSortby, selectedIndicesSortby, setState),
                        const SizedBox(height: 15),
                        _buildBoldText('Type'),
                        const SizedBox(height: 15),
                        _buildButtonRow(
                            buttonType, selectedIndicesType, setState),
                        const SizedBox(height: 15),
                        _buildBoldText('Gender'),
                        const SizedBox(height: 15),
                        _buildButtonRow(
                            buttonGender, selectedIndicesGender, setState),
                        const SizedBox(height: 15),
                        _buildBoldText('Include'),
                        const SizedBox(height: 15),
                        _buildButtonRow(
                            buttonInclude, selectedIndicesInclude, setState),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  static Widget _buildButtonRow(
      List<String> buttons, Set<int> selectedIndices, StateSetter setState) {
    return Wrap(
      spacing: 3.0,
      runSpacing: 8.0,
      children: List.generate(
        buttons.length,
        (index) => GestureDetector(
          onTap: () {
            setState(() {
              if (selectedIndices.contains(index)) {
                selectedIndices.remove(index);
              } else {
                selectedIndices.add(index);
              }
            });
          },
          child: _buildButton(
              index, buttons[index], selectedIndices.contains(index)),
        ),
      ),
    );
  }

  static AnimatedContainer _buildButton(
      int index, String label, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : null,
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  static Widget _buildBoldText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.black,
      ),
    );
  }
}
