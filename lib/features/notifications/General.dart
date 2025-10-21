import 'package:flutter/material.dart';

// Model for a notification
class NotificationItem {
  final String title;
  final String body;
  final DateTime time;
  final NotificationType type;
  bool isRead;

  NotificationItem({
    required this.title,
    required this.body,
    required this.time,
    required this.type,
    this.isRead = false,
  });
}

enum NotificationType { weather, alert, news }

class GeneralNotificationPage extends StatefulWidget {
  const GeneralNotificationPage({super.key});

  @override
  _GeneralNotificationPageState createState() =>
      _GeneralNotificationPageState();
}

class _GeneralNotificationPageState extends State<GeneralNotificationPage> {
  final List<NotificationItem> _notifications = [
    NotificationItem(
      title: 'Cập nhật thời tiết',
      body: 'Trời gió mạnh',
      time: DateTime.now().subtract(Duration(hours: 1)),
      type: NotificationType.weather,
    ),
    NotificationItem(
      title: 'Báo động',
      body: 'Vùng biển A đang có sóng lớn',
      time: DateTime.now().subtract(Duration(hours: 2)),
      type: NotificationType.alert,
      isRead: true,
    ),
    NotificationItem(
      title: 'Tin mới',
      body: 'Bến cảng B mở cửa trở lại',
      time: DateTime.now().subtract(Duration(days: 1)),
      type: NotificationType.news,
    ),
    NotificationItem(
      title: 'Cảnh báo',
      body: 'Phát hiện vật thể lạ gần tàu',
      time: DateTime.now().subtract(Duration(minutes: 30)),
      type: NotificationType.alert,
    ),
  ];

  IconData _getIconForType(NotificationType type) {
    switch (type) {
      case NotificationType.weather:
        return Icons.cloud_outlined;
      case NotificationType.alert:
        return Icons.warning_amber_rounded;
      case NotificationType.news:
        return Icons.article_outlined;
      default:
        return Icons.campaign;
    }
  }

  void _markAsRead(int index) {
    setState(() {
      _notifications[index].isRead = true;
    });
  }

  void _deleteNotification(int index) {
    setState(() {
      _notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông báo'),
        backgroundColor: Colors.blue.shade600,
      ),
      body: _notifications.isEmpty
          ? Center(
              child: Text(
                'No notifications',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                final notification = _notifications[index];
                return Dismissible(
                  key: Key(notification.time.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    _deleteNotification(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${notification.title} dismissed'),
                      ),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(Icons.delete_outline, color: Colors.white),
                  ),
                  child: Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    ),
                    color: notification.isRead ? Colors.white : Colors.blue[50],
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(
                          context,
                        ).primaryColor.withAlpha(30),
                        child: Icon(
                          _getIconForType(notification.type),
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      title: Text(
                        notification.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notification.body),
                          SizedBox(height: 4),
                          Text(
                            // Simplified time ago
                            '${DateTime.now().difference(notification.time).inHours} hours ago',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      onTap: () => _markAsRead(index),
                      trailing: notification.isRead
                          ? null
                          : Icon(Icons.circle, color: Colors.blue, size: 12),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
