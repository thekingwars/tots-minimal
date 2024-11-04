import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tots_test_app/core/delegates/search_clients_delegate.dart';
import 'package:tots_test_app/ui/common/app_colors.dart';
import 'package:tots_test_app/ui/common/ui_helpers.dart';
import 'package:tots_test_app/ui/widgets/clients_card.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    super.onViewModelReady(viewModel);

    if (viewModel.clients.isEmpty) {
      viewModel.getClients();
    }
  }

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return RefreshIndicator(
                onRefresh: viewModel.getClients,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Spacer(),
                            Center(
                              child: Image.asset(
                                'assets/images/logo_small.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  viewModel.logout();
                                },
                                child: const Text('Cerrar Session'),
                              ),
                            ),
                          ],
                        ),
                        verticalSpaceSmall,
                        Text(
                          'CLIENTS',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: const Color(0xFF434545),
                                  ),
                        ),
                        verticalSpaceMedium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 235,
                              height: 45,
                              child: SizedBox(
                                width: 217,
                                child: TextField(
                                  readOnly: true,
                                  onTap: () {
                                    showSearch(
                                      context: context,
                                      delegate: ClientSearchDelegate(
                                        viewModel,
                                      ),
                                    );
                                  },
                                  textAlignVertical: TextAlignVertical.bottom,
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                  onTapOutside: (event) =>
                                      FocusScope.of(context).unfocus(),
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(
                                      size: 20,
                                      Icons.search,
                                      color: Color(0xFFC4C4C4),
                                    ),
                                    hintText: 'Search...',
                                    hintStyle: const TextStyle(
                                      fontSize: 13,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                              height: 35,
                              child: FilledButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kcDarkGreyColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                onPressed: () {
                                  viewModel.navigateToUpsetClientView();
                                },
                                child: const Text(
                                  'ADD NEW',
                                  style: TextStyle(
                                    fontSize: 11,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpaceMedium,
                        Visibility(
                          visible: !viewModel.isBusy,
                          replacement: const Center(
                            child: CircularProgressIndicator(),
                          ),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: viewModel.clients.length,
                            itemBuilder: (context, index) {
                              final client = viewModel.clients[index];

                              return ClientsCard(
                                client: client,
                                viewModel: viewModel,
                              );
                            },
                          ),
                        ),
                        Visibility(
                          visible: !viewModel.isBusy && viewModel.canLoadMore,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: viewModel.loadMoreClient,
                                child: const Text(
                                  'LOAD MORE',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
