import 'package:mobx/mobx.dart';

import 'shared/repositories/report_repository.dart';

part 'status_controller.g.dart';

class StatusController = _StatusControllerBase with _$StatusController;

abstract class _StatusControllerBase with Store {
  final ReportRepository reportRepository;

  @observable
  ObservableFuture reports;

  _StatusControllerBase(this.reportRepository) {
    reports = reportRepository.getReports().asObservable();
  }
}
