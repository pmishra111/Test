@isTest
private class VerifyDateTest {
 
        @isTest static void TestcheckDatesWithin30(){
         date d1 = date.newInstance(2016,01,12);
         date d2 = date.newinstance(2016,02,09);
        
         Date dtest = VerifyDate.CheckDates( d1 , d2 );
         system.assertEquals(d2, dtest);
    }
    
    @isTest static void TestDateNotWithtin30(){
        
        date d1 = date.newinstance(2016,01,12);
       date d3 = date.newInstance(2016,02,22);
       date d4endofmonth = date.newinstance(2016,01,31);
        
        Date dtest = VerifyDate.CheckDates(d1, d3);
        system.assertEquals(d4endofmonth, dtest);
        
    } 
}