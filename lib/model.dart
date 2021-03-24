enum Gender{MALE,FEMALE,OTHERS}
enum ProgrammingLanguage{JAVA,DART,SWIFT,PYTHON}

class Settings{
  final String userName;
  final Gender gender;
  final Set<ProgrammingLanguage> programmingLanguage;
  final bool isEmployed;
  Settings(
      this.userName, this.gender, this.programmingLanguage, this.isEmployed);
}