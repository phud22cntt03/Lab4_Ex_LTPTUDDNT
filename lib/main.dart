import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Week4ExercisesApp());
}

class Week4ExercisesApp extends StatelessWidget {
  const Week4ExercisesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 4 Exercises',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0F766E)),
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
        useMaterial3: true,
      ),
      home: const ExerciseHomePage(),
    );
  }
}

class ExerciseHomePage extends StatelessWidget {
  const ExerciseHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final exercises = <ExerciseEntry>[
      const ExerciseEntry(
        title: '1. List View Exercise',
        subtitle: 'Scrollable contact list with placeholder avatar image',
        icon: Icons.contacts_rounded,
        page: ContactListPage(),
      ),
      const ExerciseEntry(
        title: '2. Grid View Exercise',
        subtitle: 'GridView.count() and GridView.extent() gallery',
        icon: Icons.grid_view_rounded,
        page: GridGalleryPage(),
      ),
      const ExerciseEntry(
        title: '3. Shared Preferences Exercise',
        subtitle: 'Save, show, and clear local user information',
        icon: Icons.save_rounded,
        page: SharedPreferencesPage(),
      ),
      const ExerciseEntry(
        title: '4. Async Programming Exercise',
        subtitle: 'Simulate loading a user with a 3 second delay',
        icon: Icons.hourglass_bottom_rounded,
        page: AsyncProgrammingPage(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Week 4 Flutter Exercises'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(18),
                leading: CircleAvatar(
                  radius: 26,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primaryContainer,
                  child: Icon(
                    exercise.icon,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                title: Text(
                  exercise.title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(exercise.subtitle),
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(builder: (_) => exercise.page),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class ExerciseEntry {
  const ExerciseEntry({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.page,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Widget page;
}

class Contact {
  const Contact({required this.name, required this.phone, required this.email});

  final String name;
  final String phone;
  final String email;
}

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  static const _contacts = <Contact>[
    Contact(
      name: 'An Nguyen',
      phone: '0901 223 344',
      email: 'an.nguyen@email.com',
    ),
    Contact(
      name: 'Binh Tran',
      phone: '0902 334 455',
      email: 'binh.tran@email.com',
    ),
    Contact(name: 'Chi Le', phone: '0903 445 566', email: 'chi.le@email.com'),
    Contact(
      name: 'Dung Pham',
      phone: '0904 556 677',
      email: 'dung.pham@email.com',
    ),
    Contact(
      name: 'Giang Vo',
      phone: '0905 667 788',
      email: 'giang.vo@email.com',
    ),
    Contact(name: 'Hai Do', phone: '0906 778 899', email: 'hai.do@email.com'),
    Contact(name: 'Hoa Bui', phone: '0907 889 900', email: 'hoa.bui@email.com'),
    Contact(
      name: 'Khanh Truong',
      phone: '0908 991 122',
      email: 'khanh.truong@email.com',
    ),
    Contact(name: 'Lan Ho', phone: '0909 112 233', email: 'lan.ho@email.com'),
    Contact(
      name: 'Minh Dang',
      phone: '0910 223 344',
      email: 'minh.dang@email.com',
    ),
    Contact(name: 'Nam Vu', phone: '0911 334 455', email: 'nam.vu@email.com'),
    Contact(name: 'Phuc Ly', phone: '0912 445 566', email: 'phuc.ly@email.com'),
    Contact(
      name: 'Quynh Mai',
      phone: '0913 556 677',
      email: 'quynh.mai@email.com',
    ),
    Contact(
      name: 'Son Truong',
      phone: '0914 667 788',
      email: 'son.truong@email.com',
    ),
    Contact(
      name: 'Trang Phan',
      phone: '0915 778 899',
      email: 'trang.phan@email.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact List')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _contacts.length,
        separatorBuilder: (_, _) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final contact = _contacts[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              leading: const CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(
                  'assets/images/avatar_placeholder.png',
                ),
              ),
              title: Text(
                contact.name,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(contact.phone),
                    const SizedBox(height: 2),
                    Text(contact.email),
                  ],
                ),
              ),
              trailing: const Icon(Icons.chat_bubble_outline_rounded),
            ),
          );
        },
      ),
    );
  }
}

class GridItemData {
  const GridItemData({
    required this.label,
    required this.icon,
    required this.color,
  });

  final String label;
  final IconData icon;
  final Color color;
}

class GridGalleryPage extends StatelessWidget {
  const GridGalleryPage({super.key});

  static const _items = <GridItemData>[
    GridItemData(
      label: 'Item 1',
      icon: Icons.camera_alt_rounded,
      color: Color(0xFFF97316),
    ),
    GridItemData(
      label: 'Item 2',
      icon: Icons.favorite_rounded,
      color: Color(0xFFEF4444),
    ),
    GridItemData(
      label: 'Item 3',
      icon: Icons.flight_rounded,
      color: Color(0xFF3B82F6),
    ),
    GridItemData(
      label: 'Item 4',
      icon: Icons.music_note_rounded,
      color: Color(0xFF8B5CF6),
    ),
    GridItemData(
      label: 'Item 5',
      icon: Icons.pets_rounded,
      color: Color(0xFF14B8A6),
    ),
    GridItemData(
      label: 'Item 6',
      icon: Icons.coffee_rounded,
      color: Color(0xFFA16207),
    ),
    GridItemData(
      label: 'Item 7',
      icon: Icons.park_rounded,
      color: Color(0xFF22C55E),
    ),
    GridItemData(
      label: 'Item 8',
      icon: Icons.palette_rounded,
      color: Color(0xFFE11D48),
    ),
    GridItemData(
      label: 'Item 9',
      icon: Icons.star_rounded,
      color: Color(0xFFF59E0B),
    ),
    GridItemData(
      label: 'Item 10',
      icon: Icons.headphones_rounded,
      color: Color(0xFF0EA5E9),
    ),
    GridItemData(
      label: 'Item 11',
      icon: Icons.book_rounded,
      color: Color(0xFF6366F1),
    ),
    GridItemData(
      label: 'Item 12',
      icon: Icons.sports_esports_rounded,
      color: Color(0xFF10B981),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grid View Exercise')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fixed Column Grid',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: _items.map(_buildGridTile).toList(),
            ),
            const SizedBox(height: 24),
            Text(
              'Responsive Grid',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 12),
            GridView.extent(
              maxCrossAxisExtent: 150,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: _items.map(_buildGridTile).toList(),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildGridTile(GridItemData item) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: item.color,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Icon(item.icon, size: 34, color: Colors.white),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class SharedPreferencesPage extends StatefulWidget {
  const SharedPreferencesPage({super.key});

  @override
  State<SharedPreferencesPage> createState() => _SharedPreferencesPageState();
}

class _SharedPreferencesPageState extends State<SharedPreferencesPage> {
  static const _nameKey = 'saved_name';
  static const _ageKey = 'saved_age';
  static const _emailKey = 'saved_email';
  static const _timestampKey = 'saved_timestamp';

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();

  String _message = 'No data loaded yet.';

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _saveData() async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final email = _emailController.text.trim();

    if (name.isEmpty) {
      _showSnackBar('Please enter a username before saving.');
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    final timestamp = DateTime.now().toIso8601String();

    await prefs.setString(_nameKey, name);
    await prefs.setString(_ageKey, age);
    await prefs.setString(_emailKey, email);
    await prefs.setString(_timestampKey, timestamp);

    if (!mounted) {
      return;
    }

    setState(() {
      _message =
          'Saved successfully for $name.\nLast saved: ${_formatTimestamp(timestamp)}';
    });
    _showSnackBar('Name saved successfully.');
  }

  Future<void> _showSavedData() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString(_nameKey);
    final age = prefs.getString(_ageKey);
    final email = prefs.getString(_emailKey);
    final timestamp = prefs.getString(_timestampKey);

    if (!mounted) {
      return;
    }

    setState(() {
      if (name == null || name.isEmpty) {
        _message = 'No saved data available.';
        return;
      }

      _message = [
        'Username: $name',
        'Age: ${age == null || age.isEmpty ? 'Not provided' : age}',
        'Email: ${email == null || email.isEmpty ? 'Not provided' : email}',
        'Last saved: ${timestamp == null ? 'Unknown' : _formatTimestamp(timestamp)}',
      ].join('\n');
    });
  }

  Future<void> _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_nameKey);
    await prefs.remove(_ageKey);
    await prefs.remove(_emailKey);
    await prefs.remove(_timestampKey);

    if (!mounted) {
      return;
    }

    _nameController.clear();
    _ageController.clear();
    _emailController.clear();

    setState(() {
      _message = 'Saved data has been cleared.';
    });
    _showSnackBar('Saved data removed.');
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  String _formatTimestamp(String rawValue) {
    final dateTime = DateTime.tryParse(rawValue);
    if (dateTime == null) {
      return rawValue;
    }

    final local = dateTime.toLocal();
    final twoDigitMonth = local.month.toString().padLeft(2, '0');
    final twoDigitDay = local.day.toString().padLeft(2, '0');
    final twoDigitHour = local.hour.toString().padLeft(2, '0');
    final twoDigitMinute = local.minute.toString().padLeft(2, '0');
    final twoDigitSecond = local.second.toString().padLeft(2, '0');

    return '$twoDigitDay/$twoDigitMonth/${local.year} '
        '$twoDigitHour:$twoDigitMinute:$twoDigitSecond';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared Preferences')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTextField(
            controller: _nameController,
            label: 'Username',
            icon: Icons.person_rounded,
          ),
          const SizedBox(height: 12),
          _buildTextField(
            controller: _ageController,
            label: 'Age',
            icon: Icons.cake_rounded,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),
          _buildTextField(
            controller: _emailController,
            label: 'Email',
            icon: Icons.email_rounded,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),
          FilledButton.icon(
            onPressed: _saveData,
            icon: const Icon(Icons.save_rounded),
            label: const Text('Save Name'),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: _showSavedData,
            icon: const Icon(Icons.visibility_rounded),
            label: const Text('Show Name'),
          ),
          const SizedBox(height: 10),
          TextButton.icon(
            onPressed: _clearData,
            icon: const Icon(Icons.delete_outline_rounded),
            label: const Text('Clear'),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Text(_message, style: Theme.of(context).textTheme.bodyLarge),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class AsyncProgrammingPage extends StatefulWidget {
  const AsyncProgrammingPage({super.key});

  @override
  State<AsyncProgrammingPage> createState() => _AsyncProgrammingPageState();
}

class _AsyncProgrammingPageState extends State<AsyncProgrammingPage> {
  String _status = 'Loading user...';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    setState(() {
      _isLoading = true;
      _status = 'Loading user...';
    });

    await Future<void>.delayed(const Duration(seconds: 3));

    if (!mounted) {
      return;
    }

    setState(() {
      _isLoading = false;
      _status = 'User loaded successfully!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Async Programming')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _isLoading
                    ? const CircularProgressIndicator(key: ValueKey('loading'))
                    : const Icon(
                        Icons.check_circle_rounded,
                        key: ValueKey('success'),
                        color: Colors.green,
                        size: 72,
                      ),
              ),
              const SizedBox(height: 24),
              Text(
                _status,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: _loadUser,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Load Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
