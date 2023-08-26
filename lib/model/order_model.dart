import 'dart:ui';

class OrderModel{
  String _tracking_no;
  String _status;
  String _from_address;
  String _to_address;
  String _from_time;
  String _to_time;

  get tracking_no => _tracking_no;
  get status => _status;
  get from_address => _from_address;
  get to_address => _to_address;
  get from_time => _from_time;
  get to_time => _to_time;

  OrderModel(this._tracking_no, this._status,this._from_address, this._to_address, this._from_time, this._to_time);
}