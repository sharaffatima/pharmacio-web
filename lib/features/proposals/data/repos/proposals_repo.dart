import '../../../../core/networking/error/error_handler/network_exceptions.dart';
import '../../../../core/networking/network_info.dart';
import '../datasources/proposals_remote_data_source.dart';
import '../models/proposal_status_response.dart';
import '../models/purchase_proposal_model.dart';
import '../models/purchase_proposals_response.dart';

class ProposalsRepo {
  final ProposalsRemoteDataSource proposalsRemoteDataSource;
  final NetworkInfo networkInfo;

  ProposalsRepo({
    required this.proposalsRemoteDataSource,
    required this.networkInfo,
  });

  Future<PurchaseProposalsResponse> getProposalsList() async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.getProposalsList();
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<PurchaseProposalModel> getProposalDetail(int proposalId) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.getProposalDetail(proposalId);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<PurchaseProposalModel> approveProposal(int proposalId) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.approveProposal(proposalId);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<PurchaseProposalModel> rejectProposal(int proposalId) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.rejectProposal(proposalId);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<ProposalStatusResponse> getProposalStatus(int proposalId) async {
    if (await networkInfo.isConnected) {
      try {
        return await proposalsRemoteDataSource.getProposalStatus(proposalId);
      } catch (e) {
        throw NetworkExceptions.getException(e);
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }
}
