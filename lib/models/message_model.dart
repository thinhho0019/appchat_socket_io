class messageModel {
  final String id;
  final String sender_id;
  final String receiver_id;
  final String message;
  final String create_at;
  messageModel({required this.id,required this.sender_id,required this.receiver_id,required this.message,required this.create_at});
  factory messageModel.fromJson(Map<String,dynamic> map){
    return messageModel(id: map['id'],
    sender_id: map['sender_id'],
    receiver_id:map['receiver_id'],
    message: map['message'],
    create_at: map['create_at']
    );
  }
}