import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ServiceItemViewModel {
  /// 图标
  final Icon icon;

  /// 标题
  final String title;

  const ServiceItemViewModel({
    this.icon,
    this.title,
  });
}

const List<ServiceItemViewModel> serviceList = [
  ServiceItemViewModel(
    title: '计划书',
    icon: Icon(FontAwesomeIcons.bookOpen, color: Colors.deepOrange,),
  ),
  ServiceItemViewModel(
    title: '高端医疗',
    icon: Icon(FontAwesomeIcons.briefcaseMedical, color: Colors.red,),
  ),
  ServiceItemViewModel(
    title: '邀请有礼',
    icon: Icon(FontAwesomeIcons.userAlt, color: Colors.red,),
  ),
  ServiceItemViewModel(
    title: 'DOSM',
    icon: Icon(FontAwesomeIcons.dollarSign, color: Colors.red,),
  ),
  ServiceItemViewModel(
    title: '任务中心',
    icon: Icon(FontAwesomeIcons.tasks, color: Colors.red,),
  ),
  ServiceItemViewModel(
    title: '续保管理',
    icon: Icon(FontAwesomeIcons.trophy, color: Colors.red,),
  ),
  ServiceItemViewModel(
    title: '好赔',
    icon: Icon(FontAwesomeIcons.paypal, color: Colors.red,),
  ),
  ServiceItemViewModel(
    title: '学吧',
    icon: Icon(FontAwesomeIcons.studiovinari, color: Colors.red,),
  ),
  ServiceItemViewModel(
    title: '工作室',
    icon: Icon(FontAwesomeIcons.phoenixFramework, color: Colors.red,),
  ),
  ServiceItemViewModel(
    title: '保贝商城',
    icon: Icon(FontAwesomeIcons.store, color: Colors.red,),
  ),
];