import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mark_email_read),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          final isUnread = index < 3;
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isUnread
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey,
                child: Icon(
                  _getNotificationIcon(index),
                  color: Colors.white,
                ),
              ),
              title: Text(
                _getNotificationTitle(index),
                style: TextStyle(
                  fontWeight: isUnread ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_getNotificationMessage(index)),
                  const SizedBox(height: 4),
                  Text(
                    '${index + 1} hours ago',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              trailing: isUnread
                  ? Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    )
                  : null,
              onTap: () {},
            ),
          );
        },
      ),
    );
  }

  IconData _getNotificationIcon(int index) {
    switch (index % 4) {
      case 0:
        return Icons.shopping_cart;
      case 1:
        return Icons.local_offer;
      case 2:
        return Icons.delivery_dining;
      case 3:
        return Icons.star;
      default:
        return Icons.notifications;
    }
  }

  String _getNotificationTitle(int index) {
    switch (index % 4) {
      case 0:
        return 'Order Confirmed';
      case 1:
        return 'Special Offer';
      case 2:
        return 'Delivery Update';
      case 3:
        return 'Product Review';
      default:
        return 'Notification';
    }
  }

  String _getNotificationMessage(int index) {
    switch (index % 4) {
      case 0:
        return 'Your order #${1000 + index} has been confirmed and is being processed.';
      case 1:
        return 'Get 20% off on your next purchase. Limited time offer!';
      case 2:
        return 'Your package is out for delivery and will arrive today.';
      case 3:
        return 'Please rate your recent purchase to help other customers.';
      default:
        return 'You have a new notification.';
    }
  }
}
