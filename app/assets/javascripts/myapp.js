 
 
 function date (){
  var dateInput = $("#datepicker");
  var format = 'yy-dd-mm';
  dateInput.datepicker({dateFormat: format});
  dateInput.datepicker('setDate', $.datepicker.parseDate(format, dateInput.val()));
  }