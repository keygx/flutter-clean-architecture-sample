import 'package:flutter_clean_architecture/data/sources/network/api_response.dart';
import 'package:flutter_clean_architecture/domain/entities/sample_post.dart';
import 'package:flutter_clean_architecture/domain/errors/api_error.dart';
import 'package:flutter_clean_architecture/domain/errors/error_action_type.dart';
import 'package:flutter_clean_architecture/domain/models/sample_model.dart';
import 'package:flutter_clean_architecture/domain/repositories/sample_repository.dart';
import 'package:dartz/dartz.dart';

import 'base_usecase.dart';

class SampleUseCase extends BaseFutureUseCase<SampleUseCaseParams,
    SampleUseCaseResponse, SamplePost, ApiError> {
  SampleRepository _sampleRepository;

  SampleUseCase(this._sampleRepository);

  @override
  Future<Either<ApiError, SampleUseCaseResponse>> execute(
      SampleUseCaseParams params) async {
    ApiResponse apiResponse = await _sampleRepository.post(params);
    if (apiResponse.error != null) {
      return Left(apiResponse.error);
    }
    if (apiResponse.response != null) {
      return Right(translate(SamplePost.fromJson(apiResponse.response.data)));
    }
    return Left(
      ApiError(ApiErrorType.other, "", ErrorActionType.show_alert),
    );
  }

  @override
  SampleUseCaseResponse translate(SamplePost entity) {
    return SampleUseCaseResponse(entity.username);
  }
}
