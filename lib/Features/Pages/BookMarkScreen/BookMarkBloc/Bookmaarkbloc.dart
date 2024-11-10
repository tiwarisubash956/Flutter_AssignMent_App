import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterassignmentapp/Core/Storage/Secure_storage_helper.dart';
import 'package:flutterassignmentapp/Features/Pages/GalleryScreen/Data/Model/ImageModel.dart';

class BookmarkBloc extends Cubit<List<ImageModel>> {
  final SecureStorageHelper _storageHelper;
  static const _bookmarkKey = 'bookmarks';

  BookmarkBloc(this._storageHelper) : super([]);

  Future<void> loadBookmarks() async {
    final data = await _storageHelper.getData(_bookmarkKey);
    if (data != null) {
      final bookmarks = imageModelFromJson(data);
      emit(bookmarks);
    }
  }

  Future<void> addBookmark(ImageModel image) async {
    final bookmarks = List<ImageModel>.from(state);
    bookmarks.add(image);
    emit(bookmarks);
    await _storageHelper.saveData(_bookmarkKey, imageModelToJson(bookmarks));
  }

  Future<void> removeBookmark(String id) async {
    final bookmarks = List<ImageModel>.from(state);
    bookmarks.removeWhere((image) => image.id == id);
    emit(bookmarks);
    await _storageHelper.saveData(_bookmarkKey, imageModelToJson(bookmarks));
  }
}
