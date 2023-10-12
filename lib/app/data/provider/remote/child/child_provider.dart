import 'dart:convert';

import 'package:app_read/app/data/model/child_model.dart';
import 'package:app_read/app/domain/child_entity.dart';
import '../../../../base/enviroment.dart';
import 'i_child_provider.dart';
import 'package:http/http.dart' as http;

class ChildProvider implements IChildProvider {
  @override
  Future<ChildEntity?> register(ChildEntity child) async {
    try {
      final response = await http.post(
        Uri.parse('${AppEnviroment.baseUrl}/child'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(ChildModel.fromEntity(child).toMap()),
      );
      if (response.statusCode == 200) {
        return ChildModel.fromMap(jsonDecode(response.body));
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<List<ChildEntity>> getChildsFromFatherUuid(String fatherUuid) async {
    List<ChildEntity> childs = <ChildEntity>[];
    try {
      final response = await http.post(
        Uri.parse('${AppEnviroment.baseUrl}/child/searchChildByUuidFather'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String?, String?>{
            'fatherUuid': fatherUuid,
          },
        ),
      );
      if (response.statusCode == 200) {
        final decodedResponse = jsonDecode(response.body)['childList'] as List;
        for (var child in decodedResponse) {
          childs.add(ChildModel.fromMap(child));
        }
      }
      return childs;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteChild(String uuidChild) async {
    try {
      final response = await http.delete(
        Uri.parse('${AppEnviroment.baseUrl}/child/deleteChild'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String?, String?>{"uuid": uuidChild},
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> updateChild(ChildEntity child) async {
    Map<String, dynamic> jsonBody = {
      "childName": child.childName,
      "childAge": child.age,
      "uuidChild": child.uuidChild
    };
    try {
      final response = await http.post(
        Uri.parse('${AppEnviroment.baseUrl}/child/updateChild'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(jsonBody),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
