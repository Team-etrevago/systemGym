import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../constants/api_links.dart';
import '../../constants/headers.dart';
import '../../model/player_model.dart';
import '../../services/failures.dart';
import '../../services/logger.dart';
import '../../services/network.dart';

class PlayerRemoteDataSource {
  final NetworkManager _networkManager = NetworkManager(Dio());
  final _log = logger(PlayerRemoteDataSource);

  Future<Either<Failures, PlayerModel>> addPlayer(Map<String, dynamic> data) async {
    try {
      final response = await _networkManager.request(RequestMethod.post, ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login_player, data: data, headers: AppHeaders.headers);
      _log.i(response.data);
      PlayerModel playerModel = PlayerModel.fromJson(response.data['data']);
      return Right(playerModel);
    } catch (e) {
      return Left(SomthingWrongFailures());
    }
  }

  Future<Either<Failures, List<PlayerModel>>> allPlayer() async {
    try {
      final response = await _networkManager.request(RequestMethod.post, ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login_player, headers: AppHeaders.headers);
      _log.i(response.data);
      List<PlayerModel> data = List.from(response.data.map((e) => PlayerModel.fromJson(e)));
      return Right(data);
    } catch (e) {
      return Left(SomthingWrongFailures());
    }
  }

  Future<Either<Failures, List<PlayerModel>>> updataPlayer(int id) async {
    try {
      final response = await _networkManager.request(RequestMethod.put, ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login_player, headers: AppHeaders.headers);
      _log.i(response.data);
      List<PlayerModel> data = List.from(response.data.map((e) => PlayerModel.fromJson(e)));
      return Right(data);
    } catch (e) {
      return Left(SomthingWrongFailures());
    }
  }

  Future<Either<Failures, Unit>> deletePlayer(int id) async {
    try {
      final response = await _networkManager.request(RequestMethod.put, ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login_player, headers: AppHeaders.headers);
      _log.i(response.data);
      return const Right(unit);
    } catch (e) {
      return Left(SomthingWrongFailures());
    }
  }
}
