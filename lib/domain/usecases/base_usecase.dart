import 'package:dartz/dartz.dart';

abstract class BaseFutureUseCase<Params, Response, Entity, Failure> {
  Future<Either<Failure, Response>> execute(Params params);
  Response translate(Entity entity);
}

abstract class BaseStreamUseCase<Params, Response, Entity, Failure> {
  Stream<Either<Failure, Response>> execute(Params params);
  Response translate(Entity entity);
}
