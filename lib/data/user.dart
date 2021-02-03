
var userInfo = UserInfo();
CycleCharacteristics cycleCharacteristics = CycleCharacteristics();
SexualFunction sexualFunction = SexualFunction();
ReproductiveFunction reproductiveFunction = ReproductiveFunction();
RealPregnancy realPregnancy = RealPregnancy();

class UserInfo{
  String fio;
  String birthDay;
  String age;
  String education;
  String profession;
  String firstMensesAge;
  String cycleChange;
  String lastMenstruationDate;
}

class CycleCharacteristics{
  String startDays;
  String duration;
  String abundance;
  String soreness;
}

class SexualFunction{
  String sexualActivity;
  String contraceptives;
  String pastGynecologicalDiseases;
}

class ReproductiveFunction{
  String pregnanciesCount;
  String birthsCount;
  String laborProcess;
  String heightWeightChild;
  String breastfeedingPeriod;
  String abortion;
}

class RealPregnancy{
  String lastMenstruationDate;
  String gestationalAgeRegistering;
  String firstFetalMovement;
  String complications;
  String hospitalizations;
  String treatment;
}