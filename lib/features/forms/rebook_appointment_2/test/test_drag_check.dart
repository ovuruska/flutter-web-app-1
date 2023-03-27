import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrubbers_employee_application/core/data/datasources/analytics_pet/analytics_pet_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/data/datasources/analytics_pet/analytics_pet_remote_data_source_test.dart';
import 'package:scrubbers_employee_application/core/data/datasources/branch/branch_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/data/datasources/branch/branch_remote_data_source_test.dart';
import 'package:scrubbers_employee_application/core/data/datasources/client/client_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/data/datasources/client/client_remote_data_source_test.dart';
import 'package:scrubbers_employee_application/core/data/datasources/client_search/client_search_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/data/datasources/client_search/client_search_remote_data_source_test.dart';
import 'package:scrubbers_employee_application/core/data/datasources/employee/employee_remote_data_source.dart';
import 'package:scrubbers_employee_application/core/data/datasources/employee/employee_remote_data_source_test.dart';
import 'package:scrubbers_employee_application/core/domain/entities/client_entity.dart';
import 'package:scrubbers_employee_application/core/domain/entities/pet_entity.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_bloc.dart';
import 'package:scrubbers_employee_application/features/app_select_branch/presentation/bloc/app_select_branch_event.dart';
import 'package:scrubbers_employee_application/features/appointment_schedule/domain/entities/creatable_scheduling_appointment_entity.dart';
import 'package:scrubbers_employee_application/features/forms/client_autocomplete/presentation/pages/client_autocomplete.dart';
import 'package:scrubbers_employee_application/features/forms/rebook_appointment_2/presentation/widgets/form_column.dart';
import 'package:scrubbers_employee_application/features/forms/rebook_appointment_2/presentation/widgets/partial_card_factory.dart';
import 'package:scrubbers_employee_application/features/forms/select_client_pets/presentation/bloc/select_client_pets_bloc.dart';
import 'package:scrubbers_employee_application/features/forms/select_client_pets/presentation/bloc/select_client_pets_event.dart';
import 'package:scrubbers_employee_application/features/forms/select_client_pets/presentation/pages/select_client_pets.dart';
import 'package:scrubbers_employee_application/features/forms/select_client_pets/presentation/widgets/select_client_pets.dart';
import 'package:scrubbers_employee_application/init.dart';
import 'package:scrubbers_employee_application/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';


// Create a mock class for the SelectClientPetsBloc

main() async {
  SharedPreferences.setMockInitialValues({});
  TestWidgetsFlutterBinding.ensureInitialized();

  await init();
  var pets = List<PetEntity>.of(defaultPets);
  pets.add(PetEntity(
      coatType: 'Doodle',
      id: 2,
      name: 'Pet 2',
      breed: 'Breed 2',
      rabbiesVaccination: DateTime.now(),
      birth: null,
      weight: 13.0,
      specialHandling: false));

  final mockClient = ClientEntity(
      id: 1, name: 'John Doe', email: '', phone: '', address: '');

  final mockClient2 = ClientEntity(
      id: 2, name: 'John Doe', email: '', phone: '', address: '');

  final mockClient3 = ClientEntity(
      id: 3, name: 'John Doe', email: '', phone: '', address: '');

  sl.registerLazySingleton<ClientSearchRemoteDataSource>(
          () => ClientSearchRemoteDataSourceTest());
  sl.registerLazySingleton<AnalyticsPetRemoteDataSource>(
          () => AnalyticsPetRemoteDataSourceTest());
  sl.registerLazySingleton<EmployeeRemoteDataSource>(
          () => EmployeeRemoteDataSourceTest());
  sl.registerLazySingleton<ClientRemoteDataSource>(
          () => ClientRemoteDataSourceTest());
  sl.registerLazySingleton<BranchRemoteDataSource>(() => BranchRemoteDataSourceTest());

  sl<AppSelectBranchBloc>().add(AppSelectBranchEventGetAll());

  testWidgets(
      "When ClientAutocompleteView is changed, pets SelectClientpetsView selected value should be cleared",
          (WidgetTester tester) async {
        // Initialize the mock bloc

        // Pump the RebookAppointment2FormColumn widget
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: RebookAppointment2FormColumn(),
          ),
        ));

        // Find the ClientAutocompleteView widget
        final clientAutocompleteViewFinder = find.byType(ClientAutocompleteView);
        final selectClientPetsViewFinder = find.byType(SelectClientPetsView);
        final partialCardFactoryFinder = find.byType(PartialCardFactory);

        var draggableFinder = find.byWidgetPredicate((widget) =>
        widget is Draggable &&
            widget.data is CreatableSchedulingAppointmentEntity);

        // Verify the widget exists
        expect(clientAutocompleteViewFinder, findsOneWidget);
        expect(selectClientPetsViewFinder, findsOneWidget);
        expect(partialCardFactoryFinder, findsOneWidget);

        expect(draggableFinder, findsNothing);
        // Get the onChanged function from the ClientAutocompleteView widget
        final onChanged = (clientAutocompleteViewFinder.evaluate().first.widget
        as ClientAutocompleteView)
            .onSelected;

        final petChanged = (selectClientPetsViewFinder.evaluate().first.widget as SelectClientPetsView).onChanged;


        var test =[mockClient,defaultPets];

        onChanged!(test[0] as ClientEntity);
        await tester.pump();
        draggableFinder = find.byWidgetPredicate((widget) =>
        widget is Draggable &&
            widget.data is CreatableSchedulingAppointmentEntity);
        expect(draggableFinder, findsNothing);
        // Inject pets.
        var clientPets = test[1] as List<PetEntity>;
        petChanged!(clientPets[0]);

        // Pump the widget again to rebuild the UI
        await tester.pump();

        draggableFinder = find.byWidgetPredicate((widget) =>
        widget is Draggable &&
            widget.data is CreatableSchedulingAppointmentEntity);
        expect(draggableFinder, findsOneWidget);


      });

}
