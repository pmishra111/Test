public class Calculator {

   


    public PageReference Div() {
    Result=FirstValue/SecondValue;
        return null;
    }


    public PageReference Mul() {
    Result=FirstValue*SecondValue;
        return null;
    }


    public PageReference Sub() {
    Result=FirstValue-SecondValue;
        return null;
    }



    public double SecondValue { get; set; }

    public double FirstValue { get; set; }
    public double Result{get;set;}
    public void Add(){
    Result=SecondValue+FirstValue;
  
    }
}