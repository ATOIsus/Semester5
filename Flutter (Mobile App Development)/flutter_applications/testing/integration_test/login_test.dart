import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_and_api_for_class/config/router/app_route.dart';
import 'package:hive_and_api_for_class/features/auth/domain/use_case/auth_usecase.dart';
import 'package:hive_and_api_for_class/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';
import 'package:hive_and_api_for_class/features/batch/domain/use_case/batch_use_case.dart';
import 'package:hive_and_api_for_class/features/batch/presentation/viewmodel/batch_view_model.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';
import 'package:hive_and_api_for_class/features/course/domain/use_case/course_usecase.dart';
import 'package:hive_and_api_for_class/features/course/presentation/viewmodel/course_viewmodel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../test/features/auth/presentation/view/login_view_test.mocks.dart';
import '../test/unit_test/auth_test.mocks.dart';

import 'package:integration_test/integration_test.dart';

import '../test_data/batch_entity_test.dart';
import '../test_data/course_entity_test.dart';


@GenerateNiceMocks([MockSpec<BatchUseCase>(), MockSpec<CourseUseCase>()])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late AuthUseCase mockAuthuseCase;
  late BatchUseCase mockBatchUseCase;
  late CourseUseCase mockCourseUsecase;

  late List<BatchEntity> lstBatchEntity;
  late List<CourseEntity> lstCourseEntity;
  late bool isLogin;

  setUpAll(() async {
    mockAuthuseCase = MockAuthUseCase();
    mockBatchUseCase = MockBatchUseCase();
    mockCourseUsecase = MockCourseUseCase();

    lstBatchEntity = await getBatchListTest();
    lstCourseEntity = await getCourseListTest();

    isLogin = true;
  });

  testWidgets('login test', (WidgetTester tester) async {
    when(mockAuthuseCase.loginStudent('jojo', 'jojo123'))
        .thenAnswer((_) async => Right(isLogin));

    when(mockBatchUseCase.getAllBatches())
        .thenAnswer((_) async => Right(lstBatchEntity));

    when(mockCourseUsecase.getAllCourses())
        .thenAnswer((_) async => Right(lstCourseEntity));

    await tester.pumpWidget(ProviderScope(
        overrides: [
          authViewModelProvider
              .overrideWith((ref) => AuthViewModel(mockAuthuseCase)),
          batchViewModelProvider
              .overrideWith((ref) => BatchViewModel(mockBatchUseCase)),
          courseViewModelProvider
              .overrideWith((ref) => CourseViewModel(mockCourseUsecase))
        ],
        child: MaterialApp(
          initialRoute: AppRoute.loginRoute,
          routes: AppRoute.getApplicationRoute(),
        )));

    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField).at(0), 'jojo');
    await tester.enterText(find.byType(TextField).at(1), 'jojo123');

    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'),);

    await tester.pumpAndSettle();

    expect(find.text('Dashboard View'), findsOneWidget);
  });
}
