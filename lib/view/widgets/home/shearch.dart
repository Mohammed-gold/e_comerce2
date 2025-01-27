// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class shearch extends StatelessWidget {
  final String title;
  final void Function()? search;
  final void Function()? onnotifcation;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  const shearch({
    super.key,
    required this.title,
    this.search,
    this.onnotifcation,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 4,
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration(
                hintText: title,
                prefixIcon: IconButton(
                    onPressed: search, icon: const Icon(Icons.search)),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 17),
                hintStyle: const TextStyle(letterSpacing: 1, fontSize: 20),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)),
              ),
            )),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            child: IconButton(
                color: Colors.grey[200],
                padding: const EdgeInsets.symmetric(vertical: 19),
                style: IconButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: onnotifcation,
                icon: const Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.black,
                ))),
      ],
    );
  }
}
