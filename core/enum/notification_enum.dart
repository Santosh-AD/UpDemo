enum Not {
  success,
  information,
  warning,
}

extension NotString on Not {
  String str() {
    switch (index) {
      case 0:
        return 'Success';
        break;
      case 1:
        return 'Information';
        break;
      case 2:
        return 'Warning';
        break;
      default:
        return 'Success';
    }
  }
}
