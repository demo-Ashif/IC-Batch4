void main() {
  String status = 'pending';

  //switch-case statement
  switch (status) {
    case 'pending':
      print('We received your order');
      break;
    case 'processing':
      print('We are preparing your order');
      break;
    case 'shipped':
      print('We have delivered your order');
      break;
    default:
      print('Unknown status');
  }
}
