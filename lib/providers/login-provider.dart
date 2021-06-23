import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:turanv2/dtos/login-dto.dart';
import 'package:turanv2/dtos/user-dto.dart';
import 'package:turanv2/helpers/enums/keyword-enums.dart';
import 'package:turanv2/helpers/enums/login-request-status-enum.dart';
import 'package:turanv2/network-datas/network-info-credentials.dart';
import 'package:turanv2/providers/base-provider.dart';
import 'package:http/http.dart' as _httpClient;
import 'package:turanv2/network-datas/keyword-maps.dart';

class LoginProvider extends BaseProvider<LoginRequestStatus> {
  LoginRequestStatus? _requestStatus = LoginRequestStatus.Default;
  LoginRequestStatus? get requestStatus => _requestStatus;
  @override
  void updateRequestStatus(LoginRequestStatus? state, {bool notify = false}) {
    _requestStatus = state;
    if (notify) notifyListeners();
  }

  Future<UserDto?> login({LoginDto? loginDto}) async {
    try {
      updateRequestStatus(LoginRequestStatus.Waiting);
      final _url = Uri.parse(NetworkInfoCredentials().loginUrl);
      final _response = await _httpClient.post(
        _url,
        body: loginDto!.toJson(),
        headers: {
          'Content-Type': 'application/json',
          'Accept-Language': 'az',
        },
      );
      if (_response.statusCode == 200) {
        updateRequestStatus(LoginRequestStatus.Succes);
        final _responseData =
            json.decode(_response.body) as Map<String, dynamic>;

        final _mapKeywordUsersWithCount = keywordMap![KeywordEnums.Users];
        final _userDataWithCount =
            _responseData[_mapKeywordUsersWithCount] as Map<String, dynamic>;
        //

        final _mapKeywordUsersData = keywordMap![KeywordEnums.UserData];
        final _usersData =
            _userDataWithCount[_mapKeywordUsersData] as List<dynamic>;
        final _userData = _usersData[0];
        //

        UserDto _userDto = new UserDto(
          _userData[keywordMap![KeywordEnums.Id]],
          email: _userData[keywordMap![KeywordEnums.Email]],
          password: _userData[keywordMap![KeywordEnums.Password]],
          companyId: _userData[keywordMap![KeywordEnums.CompanyId]],
          name: _userData[keywordMap![KeywordEnums.Name]],
          role: _userData[keywordMap![KeywordEnums.Role]],
          title: _userData[keywordMap![KeywordEnums.Title]],
        );
        //

        updateRequestStatus(LoginRequestStatus.Succes);
        return _userDto;
      } else {
        throw Exception('Error in login provider');
      }
    } catch (error) {
      updateRequestStatus(LoginRequestStatus.Unsucces);
    } finally {
      notifyListeners();
    }
  }
}
