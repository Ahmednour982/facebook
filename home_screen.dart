import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'facebook',
          style: TextStyle(
            color: Color(0xFF1877F2),
            fontSize: 28,
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle, color: Colors.black, size: 26),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black, size: 26),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat, color: Colors.black, size: 24),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTabIcon(Icons.home, true),
              _buildTabIcon(Icons.ondemand_video, false),
              _buildTabIcon(Icons.storefront, false),
              _buildTabIcon(Icons.supervised_user_circle, false),
              _buildTabIcon(Icons.notifications_none, false),
              _buildTabIcon(Icons.menu, false),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'What\'s in Your Mind?',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.photo_library, color: Colors.green, size: 26),
              ],
            ),
          ),
          const SizedBox(height: 8),

          Container(
            height: 180,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 8),
                _buildStoryCard('Create a Story', Icons.add, true),
                _buildStoryCard('Lionel Messi', null, false),
                _buildStoryCard('Lamine Yamal', null, false),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // رأس المنشور
                ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFF0D3B66),
                    child: Text('R', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  title: const Text('Route', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('8h · 🌐', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  trailing: const Icon(Icons.more_horiz),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey.shade100,
                  child: const Center(
                    child: Text(
                      'Route Logo / Post Content',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.favorite_border, color: Colors.grey),
                          SizedBox(width: 16),
                          Icon(Icons.chat_bubble_outline, color: Colors.grey),
                          SizedBox(width: 16),
                          Icon(Icons.send_outlined, color: Colors.grey),
                        ],
                      ),
                      const Icon(Icons.bookmark_border, color: Colors.grey),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabIcon(IconData icon, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? const Color(0xFF1877F2) : Colors.grey,
          size: 28,
        ),
        if (isSelected)
          Container(
            height: 3,
            width: 30,
            color: const Color(0xFF1877F2),
            margin: const EdgeInsets.only(top: 4),
          ),
      ],
    );
  }

  Widget _buildStoryCard(String title, IconData? icon, bool isCreate) {
    return Container(
      width: 100,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isCreate ? Colors.white : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(12),
        border: isCreate ? Border.all(color: Colors.grey.shade300) : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isCreate)
            Expanded(
              child: Center(
                child: CircleAvatar(
                  backgroundColor: const Color(0xFF1877F2),
                  radius: 18,
                  child: Icon(icon, color: Colors.white, size: 20),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                color: isCreate ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}