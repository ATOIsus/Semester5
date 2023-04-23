class SimpleInterestModel{
  double simpleInterest({var principle = 0, var time = 0, var rate = 0}) => (principle * time * rate) / 100;
}