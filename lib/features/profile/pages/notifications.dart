import 'package:flutter/material.dart';
import 'package:binomi/features/profile/widget/app_bar_settings.dart';
import 'package:binomi/shared/bottom_nav_bar.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  int selectedIndex = 0;
  bool isNotificationEnabled =
      false; // Ajout de la variable isNotificationEnabled

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const AppBarSettings(),
           const SizedBox(height: 30),
          const Text('Notifications',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 40),
          _buildContainer([
            const Text('Common',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildRowInformation(
              'General Notification',
              isNotificationEnabled,
              (value) {
                setState(() {
                  isNotificationEnabled = value;
                });
              },
            ),
            _buildRowInformation(
              'Sound',
              isNotificationEnabled,
              (value) {
                setState(() {
                  isNotificationEnabled = value;
                });
              },
            ),
            _buildRowInformation(
              'Vibrate',
              isNotificationEnabled,
              (value) {
                setState(() {
                  isNotificationEnabled = value;
                });
              },
            ),
          ]),
          const SizedBox(height: 20),
          _buildContainer([
            const Text('System & services update',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildRowInformation(
              'App updates',
              isNotificationEnabled,
              (value) {
                setState(() {
                  isNotificationEnabled = value;
                });
              },
            ),
            _buildRowInformation(
              'Payment Request',
              isNotificationEnabled,
              (value) {
                setState(() {
                  isNotificationEnabled = value;
                });
              },
            ),
          ]),
          const SizedBox(height: 20),
          _buildContainer([
            const Text('Others',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildRowInformation(
              'New Service Available',
              isNotificationEnabled,
              (value) {
                setState(() {
                  isNotificationEnabled = value;
                });
              },
            ),
            _buildRowInformation(
              'New Tips Available',
              isNotificationEnabled,
              (value) {
                setState(() {
                  isNotificationEnabled = value;
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
      String content, bool value, ValueChanged<bool>? onChanged) {
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
        Transform.scale(
          scale:
              0.6, // Ajustez la valeur de scale pour changer la taille du Switch
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.blue,
            inactiveThumbColor: Colors.grey,
            activeTrackColor: Colors.lightBlueAccent,
            inactiveTrackColor: Colors.grey.withOpacity(0.5),
            thumbColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return const Color.fromARGB(255, 255, 255, 255);
              }
              return Colors.white;
            }),
          ),
        ),
      ],
    );
  }
}
