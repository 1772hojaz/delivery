import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryItem {
  const OrderHistoryItem({
    required this.id,
    required this.restaurant,
    required this.items,
    required this.date,
    required this.total,
    required this.active,
  });

  final String id;
  final String restaurant;
  final String items;
  final String date;
  final double total;
  final bool active;
}

class YourOrdersController extends GetxController with GetSingleTickerProviderStateMixin {
  late final tabController = TabController(length: 2, vsync: this);

  final orders = const [
    OrderHistoryItem(
      id: 'ord-1',
      restaurant: 'Green Bowl Kitchen',
      items: '2x Grilled Chicken Salad',
      date: 'Today, 12:30 PM',
      total: 24.50,
      active: true,
    ),
    OrderHistoryItem(
      id: 'ord-2',
      restaurant: 'Pasta Palace',
      items: '1x Creamy Alfredo Pasta',
      date: 'Today, 09:10 AM',
      total: 16.00,
      active: true,
    ),
    OrderHistoryItem(
      id: 'ord-3',
      restaurant: 'Burger House',
      items: '3x Classic Cheeseburger',
      date: 'Aug 12, 7:45 PM',
      total: 32.90,
      active: false,
    ),
    OrderHistoryItem(
      id: 'ord-4',
      restaurant: 'Sushi Central',
      items: '1x Salmon Nigiri Set',
      date: 'Aug 09, 1:15 PM',
      total: 21.75,
      active: false,
    ),
  ];

  List<OrderHistoryItem> get activeOrders => orders.where((o) => o.active).toList();
  List<OrderHistoryItem> get completedOrders => orders.where((o) => !o.active).toList();

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
