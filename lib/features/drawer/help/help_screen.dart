import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      'question': 'How do I add a new fishing trip?',
      'answer':
          'To add a new fishing trip, go to the "Trip Management" section from the main menu and tap on the "Add Trip" button. Fill in the required details and save.',
    },
    {
      'question': 'How can I view my fishing logbook?',
      'answer':
          'You can access your fishing logbook by tapping on the "Fishing Logbook" card on the homepage. This will show you a list of all your past entries.',
    },
    {
      'question': 'How do I update my vessel\'s information?',
      'answer':
          'Navigate to the "Vessel Manage" section. Here you can view and edit your vessel\'s details, including its registration number, name, and equipment.',
    },
    {
      'question': 'Where can I see the weather forecast?',
      'answer':
          'The "Map & Weather" section provides a map with current weather conditions and forecasts for your fishing locations.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help & Support')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            'Frequently Asked Questions',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 16),
          ...faqs.map((faq) {
            return Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ExpansionTile(
                title: Text(faq['question']!),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(faq['answer']!),
                  ),
                ],
              ),
            );
          }).toList(),
          Divider(height: 32),
          Text('Contact Us', style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 16),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.email_outlined),
                    title: Text('support@quanlytauca.com'),
                    onTap: () {
                      // TODO: Implement email launcher
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.phone_outlined),
                    title: Text('+84 123 456 789'),
                    onTap: () {
                      // TODO: Implement phone launcher
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
