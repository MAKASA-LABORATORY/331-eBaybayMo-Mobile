import 'package:ebaybaymo/app/app.locator.dart';
import 'package:ebaybaymo/app/app_base_view_model.dart';
import 'package:ebaybaymo/models/history.dart';
import 'package:ebaybaymo/services/api/api_service_service.dart';
import 'package:stacked_services/stacked_services.dart';

class HistoryImageViewModel extends AppBaseViewModel {
  final ApiServiceService _apiService = locator<ApiServiceService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();

  List<ImageCheckHistory> _history = [];

  List<ImageCheckHistory> get history => _history;

  // Function to fetch image check history
  Future<void> fetchImageCheckHistory() async {
    setBusy(true);
    try {
      final response =
          await _apiService.fetchImageCheckHistory(page: 1, limit: 10);
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        final List<dynamic> data = responseData['history'];
        _history =
            data.map((json) => ImageCheckHistory.fromJson(json)).toList();
        notifyListeners();
        _snackbarService.showSnackbar(
          message: 'History loaded successfully!',
          duration: const Duration(seconds: 2),
        );
      } else {
        _snackbarService.showSnackbar(
          message: 'Failed to load history',
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      _snackbarService.showSnackbar(
        message: 'Error occurred: $e',
        duration: const Duration(seconds: 2),
      );
    } finally {
      setBusy(false);
    }
  }

  // Function to delete a specific history item by index
  Future<void> deleteHistoryItem(int index) async {
    final historyItem = _history[index];
    try {
      setBusy(true);
      final response =
          await _apiService.deleteImageCheckHistory([historyItem.id]);
      if (response.statusCode == 200) {
        _history.removeAt(index);
        notifyListeners();
        _snackbarService.showSnackbar(
          message: 'History item deleted successfully!',
          duration: const Duration(seconds: 2),
        );
      } else {
        _snackbarService.showSnackbar(
          message: 'Failed to delete history item',
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      _snackbarService.showSnackbar(
        message: 'Error occurred while deleting history item: $e',
        duration: const Duration(seconds: 2),
      );
    } finally {
      setBusy(false);
    }
  }

  // Function to delete all history items
  Future<void> deleteAllHistory() async {
    final List<int> ids = _history.map((item) => item.id).toList();
    try {
      setBusy(true);
      final response = await _apiService.deleteImageCheckHistory(ids);
      if (response.statusCode == 200) {
        _history.clear();
        notifyListeners();
        _snackbarService.showSnackbar(
          message: 'All history deleted successfully!',
          duration: const Duration(seconds: 2),
        );
      } else {
        _snackbarService.showSnackbar(
          message: 'Failed to delete all history',
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      _snackbarService.showSnackbar(
        message: 'Error occurred while deleting all history: $e',
        duration: const Duration(seconds: 2),
      );
    } finally {
      setBusy(false);
    }
  }

  // Function to get image filename by index
  String getImageFilename(int index) {
    return _history[index].imageFilename;
  }

  // Function to get timestamp by index
  DateTime getTimestamp(int index) {
    return _history[index].timestamp;
  }

   // Function to get modified response text by index
  String getModifiedResponse(int index) {
    return _history[index].modifyResponseText();
  }
}
