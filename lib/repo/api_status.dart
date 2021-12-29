class Success {
  int? code;
  Object? response;
  Success({
    this.code,
     this.response,
  });
}

class Failture {
  int? code;
  Object? errorResponse;
  Failture({
     this.code,
     this.errorResponse,
  });
}
