import 'package:flutter/material.dart';
import 'package:prime_fruits/main.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // safe area
          const SizedBox(height: 28),

          // Settings
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(23.0),
            child: Container(
              alignment: AlignmentDirectional(-0.95, 0),
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                leading: Icon(Icons.brightness_6),
                title: Text(
                  'Theme',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                trailing: IconButton(
                  onPressed: () {
                    thememode.value = thememode.value == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
                  },
                  icon: Icon(Icons.dark_mode_outlined),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
