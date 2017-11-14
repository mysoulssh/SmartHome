///
//  Generated code. Do not modify.
///
// ignore_for_file: non_constant_identifier_names,library_prefixes
library IotCmdList_IotCmdList_pbjson;

const IotCmd$json = const {
  '1': 'IotCmd',
  '2': const [
    const {'1': 'cmdid', '3': 1, '4': 1, '5': 13, '10': 'cmdid'},
    const {'1': 'cmd_type', '3': 2, '4': 1, '5': 13, '10': 'cmdType'},
    const {'1': 'detail_en', '3': 3, '4': 1, '5': 9, '10': 'detailEn'},
    const {'1': 'detail_cn', '3': 4, '4': 1, '5': 9, '10': 'detailCn'},
    const {'1': 'arg_type', '3': 5, '4': 1, '5': 9, '10': 'argType'},
    const {'1': 'arg_v', '3': 6, '4': 1, '5': 9, '10': 'argV'},
    const {'1': 'arg_detail_en', '3': 7, '4': 1, '5': 9, '10': 'argDetailEn'},
    const {'1': 'arg_detail_cn', '3': 8, '4': 1, '5': 9, '10': 'argDetailCn'},
    const {'1': 'prodt_code', '3': 9, '4': 1, '5': 9, '10': 'prodtCode'},
    const {'1': 'is_review', '3': 11, '4': 1, '5': 13, '10': 'isReview'},
    const {'1': 'review_mark', '3': 12, '4': 1, '5': 9, '10': 'reviewMark'},
  ],
};

const RpcRequest$json = const {
  '1': 'RpcRequest',
  '2': const [
    const {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'page', '3': 11, '4': 1, '5': 13, '10': 'page'},
    const {'1': 'page_size', '3': 12, '4': 1, '5': 13, '10': 'pageSize'},
    const {'1': 'cmdid', '3': 22, '4': 1, '5': 13, '10': 'cmdid'},
  ],
};

const RpcResponse$json = const {
  '1': 'RpcResponse',
  '2': const [
    const {'1': 'total', '3': 11, '4': 1, '5': 13, '10': 'total'},
    const {'1': 'cmds', '3': 12, '4': 3, '5': 11, '6': '.IotCmdList.IotCmd', '10': 'cmds'},
  ],
};

