// Datepicker script
$(function() { $(".datepicker").datepicker({
    format: 'dd/MM/yyyy',
    todayHighlight: true,
    autoclose: true
  }); });

// Wysihtml5 script
$(document).ready(function(){
  $('.wysihtml5').each(function(i, elem) {
    $(elem).wysihtml5();
  }); });

// Remove webpage script
var remove_webpage = function(link) {
  console.log($(link).parent())
	$(link).prev("input[type=hidden]").val(true);
	$(link).parent().fadeOut();
};

//------------------------------------
$(document).ready(function() {
  var check_box_obj = $(".urlcheckbox");
  var index;
  for (index = 0; index < check_box_obj.length; ++index) {
    if (check_box_obj[index].checked){
      $(check_box_obj[index]).parent().siblings(".text_wysithml5").hide()
      $(check_box_obj[index]).parent().siblings(".text_simple_box").show()
    }
    else{
      $(check_box_obj[index]).parent().siblings(".text_wysithml5").show()
      $(check_box_obj[index]).parent().siblings(".text_simple_box").hide()
    }
  }
});

var checkStatus = function(check_box_obj)
{
  // console.log($(check_box_obj).parent().parent())
  // console.log($(check_box_obj).siblings())
  if (check_box_obj.checked){
    $(check_box_obj).parent().siblings(".text_wysithml5").hide()
    $(check_box_obj).parent().siblings(".text_simple_box").show()
  }
  else{
    $(check_box_obj).parent().siblings(".text_wysithml5").show()
    $(check_box_obj).parent().siblings(".text_simple_box").hide()
  }
};

//------------------------------------
$(document).ready(function() {
  $(".task").each(function() {
    if (!($(this)).children().children().first().next().val()) {
      $(this).hide();
    }
  });
});

//------------------------------------
var addTask_base = function(obj) {
  $(obj).next(".task").show();
};

var addTask = function(obj) {
  $(obj).parent().parent().next(".task").show();
};



