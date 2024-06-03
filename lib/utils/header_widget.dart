import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.displayImage,
  });

  final String displayImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(displayImage),
                    radius: 40,
                  ),
                  const SizedBox(width: 15),
                  const Text(
                    'News',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const Text('Top Breaking News',
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF000000),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}