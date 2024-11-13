import 'package:flutter/material.dart';
import 'package:thingsboard_app/core/context/tb_context.dart';
import 'package:thingsboard_app/core/context/tb_context_widget.dart';
import 'package:thingsboard_app/core/entity/entities_base.dart';
import 'package:thingsboard_app/core/entity/entities_grid.dart';
import 'package:thingsboard_app/modules/dashboard/dashboards_base.dart';
import 'package:thingsboard_app/widgets/tb_app_bar.dart';
import 'package:thingsboard_pe_client/thingsboard_client.dart';

class DashboardMainPage extends TbContextWidget {
  DashboardMainPage(TbContext tbContext) : super(tbContext);

  @override
  _DashboardMainPageState createState() => _DashboardMainPageState(); 
}

class _DashboardMainPageState extends TbContextState<DashboardMainPage> 
with AutomaticKeepAliveClientMixin<DashboardMainPage> {
  final PageLinkController _pageLinkController = PageLinkController();

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var dashboardList = DashboardsGrid(tbContext, _pageLinkController);
    return Scaffold(
        appBar: TbAppBar(tbContext, title: Text(dashboardList.title)),
        body: dashboardList);
  }

  @override
  void dispose() {
    _pageLinkController.dispose();
    super.dispose();
  }
}

class DashboardsGrid extends BaseEntitiesWidget<DashboardInfo, PageLink>
    with DashboardsBase, EntitiesGridStateBase {
  DashboardsGrid(
      TbContext tbContext, PageKeyController<PageLink> pageKeyController)
      : super(tbContext, pageKeyController);
}