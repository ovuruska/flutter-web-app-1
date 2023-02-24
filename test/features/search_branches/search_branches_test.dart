import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:scrubbers_employee_application/features/search_branches/domain/repositories/search_branches.dart';
import 'package:scrubbers_employee_application/features/search_branches/domain/usecases/get_branches.dart';
import 'package:scrubbers_employee_application/features/search_branches/presentation/bloc/search_branches_bloc.dart';
import 'package:scrubbers_employee_application/features/search_branches/presentation/pages/search_branches.dart';
import 'package:scrubbers_employee_application/features/search_branches/presentation/widgets/branch_card.dart';

import 'repository/search_branches_mock.dart';

void main() {
  final sl = GetIt.instance;
  // BLoCs
  sl.registerLazySingleton(() => SearchBranchesBloc(getBranches: sl()));
  sl.registerLazySingleton<SearchBranchesRepository>(
      () => SearchBranchesRepositoryMockImpl(10));
  sl.registerLazySingleton(() => GetBranches(sl()));

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
