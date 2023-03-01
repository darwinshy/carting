// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:carting/views/cart/cart_v.dart' as _i2;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart' as _i3;

class Routes {
  static const cartView = 'cart';

  static const all = <String>{cartView};
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.cartView,
      page: _i2.CartView,
    )
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.CartView: (data) {
      return MaterialPageRoute<StackedRoute<dynamic>>(
        builder: (context) => const _i2.CartView(),
        settings: data,
      );
    }
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i3.NavigationService {
  Future<StackedRoute<dynamic>?> navigateToCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return navigateTo<StackedRoute<dynamic>?>(Routes.cartView,
        id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }

  Future<StackedRoute<dynamic>?> replaceWithCartView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)? transition,
  ]) async {
    return replaceWith<StackedRoute<dynamic>?>(Routes.cartView,
        id: routerId, preventDuplicates: preventDuplicates, parameters: parameters, transition: transition);
  }
}
