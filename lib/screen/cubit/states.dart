abstract class loadimageStates{}
class loadimageInitialstate extends loadimageStates{}

class loadimageLodingstate extends loadimageStates{}

class loadimagesuccess extends loadimageStates{}

class loadimageError extends loadimageStates{
  final String error;

  loadimageError(this.error);
}