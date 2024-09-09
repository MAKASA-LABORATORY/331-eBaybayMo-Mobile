import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';
import 'history_image_viewmodel.dart';

class HistoryImageView extends StackedView<HistoryImageViewModel> {
  const HistoryImageView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HistoryImageViewModel viewModel,
    Widget? child,
  ) {
    final screenHeight = MediaQuery.of(context).size.height;
    final responsivePadding = screenHeight * 0.01;
    final topPadding = screenHeight * 0.01;

    void _showDeleteConfirmationDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Delete all the history',
              style: GoogleFonts.poppins(color: Colors.black),
            ),
            content: Text(
              'Are you sure you want to delete all history?',
              style: GoogleFonts.poppins(color: Colors.black),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Cancel',
                  style: GoogleFonts.poppins(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  viewModel.deleteAllHistory();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Delete',
                  style: GoogleFonts.poppins(color: Colors.black),
                ),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA52A2A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Image Check History',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 19),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: _showDeleteConfirmationDialog,
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: viewModel.isBusy
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: Color(0xFFA52A2A),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'Fetching history...',
                    style: GoogleFonts.poppins(),
                  ),
                ],
              ),
            )
          : viewModel.history.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 150,
                        child: Lottie.asset(
                          'lib/resources/images/no_found.json',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        'No history found.',
                        style: GoogleFonts.poppins(),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.fromLTRB(
                    15.0,
                    topPadding,
                    15.0,
                    responsivePadding,
                  ),
                  itemCount: viewModel.history.length,
                  itemBuilder: (context, index) {
                    final historyItem = viewModel.history[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3.0),
                      child: Dismissible(
                        key: Key(historyItem.id.toString()),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          alignment: Alignment.centerRight,
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        onDismissed: (direction) {
                          viewModel.deleteHistoryItem(index);
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 250, 247, 247),
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2.0,
                                offset: Offset(0, 2),
                              ),
                            ],
                            border: Border.all(
                              color: const Color.fromARGB(255, 218, 216, 216),
                              width: 0.4,
                            ),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(8.0),
                            leading: const CircleAvatar(
                              backgroundImage:
                                  AssetImage('lib/resources/images/logo.png'),
                              radius: 24.0,
                              backgroundColor:
                                  Color.fromARGB(255, 209, 207, 207),
                            ),
                            title: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        viewModel.getModifiedResponse(index),
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8.0),
                                Text(
                                  viewModel
                                      .getTimestamp(index)
                                      .toLocal()
                                      .toString(),
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
    );
  }

  @override
  HistoryImageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HistoryImageViewModel();

  @override
  void onViewModelReady(HistoryImageViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.fetchImageCheckHistory();
  }
}
