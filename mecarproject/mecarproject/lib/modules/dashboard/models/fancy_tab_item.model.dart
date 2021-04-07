import '../views/dashboard.view.dart';

class FancyTabItemModel {
  const FancyTabItemModel(this.icon, this.type);

  final String icon;
  final TabType type;

  @override
  List<Object> get props => <Object>[ icon, type];
}
