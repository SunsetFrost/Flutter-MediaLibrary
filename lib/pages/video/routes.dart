import 'package:flutter/material.dart';

const String listRoute = '/video';
const String detailRoute = '/video/detail';
const String playerRoute = '/video/player';

class DetailArguments extends RouteSettings {
  final int id;

  DetailArguments(this.id);
}
