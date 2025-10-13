import 'dart:developer';

import 'package:bookia/core/services/dio/api_endpoints.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/feature/wishlist/data/models/wishlist_response/datum.dart';
import 'package:bookia/feature/wishlist/data/models/wishlist_response/wishlist_response.dart';

class WishlistRepo {
  static Future<WishListResponse?> getWishlist() async {
    try {
      log(SharedPref.getUserData()?.token.toString() ?? "No Token");
      var res = await DioProvider.get(
        path: ApiEndpoints.wishList,
        headers: {"Authorization": "${SharedPref.getUserData()?.token}"},
      );
      if (res.statusCode == 200) {
        var data = WishListResponse.fromJson(res.data);
        saveWishlistToLocal(data.data?.data ?? []);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<WishListResponse?> addToWishlist({
    required int productId,
  }) async {
    try {
      var res = await DioProvider.post(
        path: ApiEndpoints.addToWishlist,
        data: {"product_id": productId},
        headers: {"Authorization": "Bearer ${SharedPref.getUserData()?.token}"},
      );
      if (res.statusCode == 200) {
        var data = WishListResponse.fromJson(res.data);
        saveWishlistToLocal(data.data?.data ?? []);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<WishListResponse?> removeToWishlist({
    required int productId,
  }) async {
    try {
      var res = await DioProvider.post(
        path: ApiEndpoints.removeFromWishlist,
        data: {"product_id": productId},
        headers: {"Authorization": "${SharedPref.getUserData()?.token}"},
      );
      if (res.statusCode == 200) {
        var data = WishListResponse.fromJson(res.data);
        saveWishlistToLocal(data.data?.data ?? []);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static saveWishlistToLocal(List<WishlistProduct> wishlistIds) {
    if (wishlistIds.isEmpty) {
      SharedPref.saveWishlist([]);
    } else {
      List<int> bookIds = [];

      for (var id in wishlistIds) {
        bookIds.add(id.id ?? 0);
      }
      SharedPref.saveWishlist(bookIds);
    }
  }
}
