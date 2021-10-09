import 'dart:js';
import 'dart:typed_data';
import 'package:droplez/proto/common/common.v1.pb.dart';
import 'package:grpc/grpc.dart';
import 'package:droplez/proto/uploader/uploader.v1.pbgrpc.dart';
import 'package:grpc/grpc_web.dart';

class UploaderService {
  late final UploaderClient _client;
  final channel = ClientChannel('localhost',
      port: 8080,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure()));

  UploaderService() {
    final channel = GrpcWebClientChannel.xhr(Uri.parse("http://0.0.0.0:8080"));
    _client = UploaderClient(channel);
  }

  UploaderClient stub() {
    var stub = UploaderClient(channel,
        options: CallOptions(timeout: Duration(seconds: 60)));
    return stub;
  }

  Stream<Chunk> upload(Uint8List? bytes) async* {
    Chunk chunk = Chunk(
        content: bytes?.toList(),
        metadata: FileMetadata(
            author: "allanger", description: "description", name: "name"));
    yield chunk;
  }

  Chunk chunkReq(Uint8List? bytes) {
    Chunk chunk = Chunk(
        content: bytes?.toList(),
        metadata: FileMetadata(
            author: "allanger", description: "description", name: "name"));
    return chunk;
  }

  ResponseFuture<UploadedFileData> uplStr(Stream<Chunk> chunk) {
    var resp = _client.upload(chunk,
        options: CallOptions(timeout: const Duration(minutes: 5)));
    return resp;
  }
}
