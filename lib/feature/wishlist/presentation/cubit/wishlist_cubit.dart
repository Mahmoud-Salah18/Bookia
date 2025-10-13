import 'package:bookia/feature/wishlist/data/models/wishlist_response/datum.dart';
import 'package:bookia/feature/wishlist/data/repo/wishlist_repo.dart';
import 'package:bookia/feature/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishListState> {
  WishlistCubit() : super(WishListInitialState());

  List<WishlistProduct> books = [];
  getWishlist() async {
    emit(WishListLoadingState());
    var res = await WishlistRepo.getWishlist();
    if (res != null) {
      books = res.data?.data ?? [];
      emit(WishListSuccessState());
    } else {
      emit(WishListErrorState());
    }
  }

  removeFromWishlist({required int productId}) async {
    emit(WishListLoadingState());
    var res = await WishlistRepo.removeToWishlist(productId: productId);
    if (res != null) {
      books = res.data?.data ?? [];
      emit(WishListSuccessState());
    } else {
      emit(WishListErrorState());
    }
  }
}
