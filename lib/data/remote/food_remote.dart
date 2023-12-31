import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../constants/api_links.dart';
import '../../constants/headers.dart';
import '../../model/food_model.dart';
import '../../services/failures.dart';
import '../../services/logger.dart';
import '../../services/network.dart';

class FoodRemoteDataSource {
  final NetworkManager _networkManager = NetworkManager(Dio());
  final _log = logger(FoodRemoteDataSource);

  Future<Either<Failures, FoodModel>> addFood(Map<String, dynamic> data) async {
    try {
      final response = await _networkManager.request(RequestMethod.post, ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login_player, data: data, headers: AppHeaders.headers);
      _log.i(response.data);
      FoodModel foodModel = FoodModel.fromJson(response.data['data']);
      return Right(foodModel);
    } catch (e) {
      return Left(SomthingWrongFailures());
    }
  }

  Future<Either<Failures, List<FoodModel>>> allFood() async {
    try {
      final response = await _networkManager.request(RequestMethod.post, ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login_player, headers: AppHeaders.headers);
      _log.i(response.data);
      List<FoodModel> data = List.from(response.data.map((e) => FoodModel.fromJson(e)));
      return Right(data);
    } catch (e) {
      return Left(SomthingWrongFailures());
    }
  }

  Future<Either<Failures, List<FoodModel>>> updataFood(int id) async {
    try {
      final response = await _networkManager.request(RequestMethod.put, ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login_player, headers: AppHeaders.headers);
      _log.i(response.data);
      List<FoodModel> data = List.from(response.data.map((e) => FoodModel.fromJson(e)));
      return Right(data);
    } catch (e) {
      return Left(SomthingWrongFailures());
    }
  }

  Future<Either<Failures, Unit>> deleteFood(int id) async {
    try {
      final response = await _networkManager.request(RequestMethod.put, ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login_player, headers: AppHeaders.headers);
      _log.i(response.data);
      return const Right(unit);
    } catch (e) {
      return Left(SomthingWrongFailures());
    }
  }
}
