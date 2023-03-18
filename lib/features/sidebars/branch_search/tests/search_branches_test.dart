import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';


import '../../../create_appointment/domain/usecases/get_branches.dart';
import '../data/repositories/create_new_branch_impl.dart';
import '../data/repositories/remove_branch_impl.dart';
import '../domain/repositories/create_new_branch.dart';
import '../domain/repositories/remove_branch.dart';
import '../domain/repositories/search_branches.dart';
import '../domain/usecases/create_new_branch.dart';
import '../domain/usecases/remove_branch.dart';
import '../presentation/bloc/search_branches_bloc.dart';
import '../presentation/pages/search_branches.dart';
import '../presentation/widgets/branch_card.dart';
import 'repository/search_branches_mock.dart';

void main() {
  final sl = GetIt.instance;
  // BLoCs
  sl.registerLazySingleton(() => SearchBranchesBloc(createNewBranch:sl(),getBranches: sl(), removeBranch: sl()));
  sl.registerLazySingleton<SearchBranchesRepository>(
      () => SearchBranchesRepositoryMockImpl(10));
  sl.registerLazySingleton<CreateNewBranchRepository>(() => CreateNewBranchRepositoryImpl());
  sl.registerLazySingleton<RemoveBranchRepository>(() => RemoveBranchRepositoryImpl(  ));

  sl.registerLazySingleton(() => RemoveBranchUseCase(sl()));
  sl.registerLazySingleton(() => GetBranchesUseCase(sl()));
  sl.registerLazySingleton(() => CreateNewBranchUseCase(sl()));

  testWidgets('Search Branches widget works normally.', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SearchBranchesView(),
      ),
    );
    // Future.delayed breaks the execution
    // Correct way to delay the execution
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(BranchCard), findsNWidgets(10));
  });

  testWidgets('Search Branches search function works.', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SearchBranchesView(),
      ),
    );
    await tester.pump(const Duration(seconds: 1));
    await tester.enterText(find.byType(TextField), 'Branch 1');
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.byType(BranchCard), findsNWidgets(1));

  });

}
