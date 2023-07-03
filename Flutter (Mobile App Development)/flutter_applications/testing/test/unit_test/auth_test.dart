import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_and_api_for_class/core/failure/failure.dart';
import 'package:hive_and_api_for_class/features/auth/domain/use_case/auth_usecase.dart';
import 'package:hive_and_api_for_class/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<BuildContext>(),
])


void main() {
  late AuthUseCase mockAuthUseCase;
  late ProviderContainer container;
  late BuildContext context;

  setUpAll(()  {
    mockAuthUseCase = MockAuthUseCase();
    context = MockBuildContext();

    container = ProviderContainer(overrides: [
      authViewModelProvider
          .overrideWith((ref) => AuthViewModel(mockAuthUseCase))
    ]);
  });

  test('Test for initial state ', () async {

    final authState = container.read(authViewModelProvider);
    expect(authState.isLoading, false);
  });


  // test('login with valid username', () async {

  //   when(mockAuthUseCase.loginStudent('kiran', 'kiran123')).thenAnswer((_) => Future.value(const Right(true)));

  //   await container 
  //             .read(authViewModelProvider.notifier)
  //             .loginStudent(context, 'kiran', 'kiran123');

  //   final authState = container.read(authViewModelProvider);

  //   //If valid username and password is given, error is null
  //   expect(authState.error, isNull);
  // });


  
  test('login with invalid username', () async {

    when(mockAuthUseCase.loginStudent('kiran', 'kiran123444444')).thenAnswer((_) => Future.value(Left(Failure(error : 'Invalid'))));
    await container 
              .read(authViewModelProvider.notifier)
              .loginStudent(context, 'kiran', 'kiran123444444');

    final authState = container.read(authViewModelProvider);
    expect(authState.error, 'Invalid');
  });

 
}


//dart run build_runner build --delete-conflicting-outputs