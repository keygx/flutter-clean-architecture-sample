import 'dart:developer';
import 'package:flutter_clean_architecture/domain/errors/api_error.dart';
import 'package:flutter_clean_architecture/data/repositories/sample_repository_impl.dart';
import 'package:flutter_clean_architecture/domain/models/sample_model.dart';
import 'package:flutter_clean_architecture/domain/usecases/sample_usecase.dart';

class HomePresenter {
  Future<SampleUseCaseResponse> post(
    String username,
    String password,
  ) async {
    log("sample post");
    SampleUseCase _sampleUseCase = SampleUseCase(SampleRepositoryImpl());
    var response =
        await _sampleUseCase.execute(SampleUseCaseParams(username, password));

    var result = response.fold((failure) {
      log(failure.toString());
      return failure;
    }, (data) {
      log(data.toString());
      return data;
    });

    if (result is ApiError) {
      return Future.error(result);
    } else {
      return Future.value(result);
    }
  }
}
