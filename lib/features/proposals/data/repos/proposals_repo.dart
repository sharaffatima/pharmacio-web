import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/proposals_remote_data_source.dart';
import '../models/compare_offers_request_body.dart';
import '../models/drug_comparison_model.dart';
import '../models/proposal_status_model.dart';
import '../models/purchase_proposal_model.dart';

class ProposalsRepo {
  final ProposalsRemoteDataSource proposalsRemoteDataSource;
  final NetworkInfo networkInfo;

  ProposalsRepo({
    required this.proposalsRemoteDataSource,
    required this.networkInfo,
  });

  Future<List<DrugComparisonModel>> compareOffers(
    CompareOffersRequestBody body,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.compareOffers(body);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<PurchaseProposalModel> generateProposal(
    CompareOffersRequestBody body,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.generateProposal(body);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<List<PurchaseProposalModel>> getProposals() async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.getProposals();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<PurchaseProposalModel> getProposalDetail(int id) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.getProposalDetail(id);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<PurchaseProposalModel> approveProposal(int id) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.approveProposal(id);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<PurchaseProposalModel> rejectProposal(int id) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.rejectProposal(id);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<ProposalStatusModel> getProposalStatus(int id) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.getProposalStatus(id);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
