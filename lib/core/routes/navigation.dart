import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

pushTo(BuildContext context, String route, {Object? extra}) {
  context.push(route, extra: extra);
}

pushWithReplacement(BuildContext context, String route, {Object? extra}) {
  context.pushReplacement(route, extra: extra);
}

goToBase(BuildContext context, String route, {Object? extra}) {
  context.go(route, extra: extra);
}

pop(BuildContext context) {
  context.pop();
}
