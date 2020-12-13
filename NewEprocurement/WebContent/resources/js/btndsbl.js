//Circle-Division-SubDivision
        $(document).ready(function () {

            $(function () {
                $('#sbtbtn').attr('disabled', 'disabled');
            });
            var regex = /^[a-zA-Z0-9 ]*$/;
            $('input[type=text],input[type=password]').keyup(function () {

                if ($('#target1').val() != '' && regex.test($('#target1').val()))
                {

                    $('#sbtbtn').removeAttr('disabled');
                } else {
                    $('#sbtbtn').attr('disabled', 'disabled');
                }
            });
        });
    
  
        $(document).ready(function () {

            $(function () {
                $('#sbtbtn2').attr('disabled', 'disabled');
            });
            var regex = /^[a-zA-Z0-9 ]*$/;
            $('input[type=text],input[type=password],input[type=select]').keyup(function () {

                if ($('#circle1').val() != '' &&
                        $('#division_name').val() != '' && regex.test($('#division_name').val())) {

                    $('#sbtbtn2').removeAttr('disabled');
                } else {
                    $('#sbtbtn2').attr('disabled', 'disabled');
                }
            });
        });
  
        $(document).ready(function () {

            $(function () {
                $('#sbtbtn3').attr('disabled', 'disabled');
            });
            var regex = /^[a-zA-Z0-9 ]*$/;
            $('input[type=text],input[type=password],input[type=select]').keyup(function () {

                if ($('#circle10').val() != '' && $('#division1').val() != '' &&
                        $('#subdivision_name').val() != '' && regex.test($('#subdivision_name').val())) {

                    $('#sbtbtn3').removeAttr('disabled');
                } else {
                    $('#sbtbtn3').attr('disabled', 'disabled');
                }
            });
        });
  //End----------------Circle-Division-SubDivision
  
  //productCategory SubCategory
            $(document).ready(function () {

                $(function () {
                    $('#sbtbtn').attr('disabled', 'disabled');
                });
                var regex = /^[a-zA-Z0-9 ]*$/;
                $('input[type=text],input[type=password]').keyup(function () {

                    if ($('#target1').val() != '' && regex.test($('#target1').val()))
                    {

                        $('#sbtbtn').removeAttr('disabled');
                    } else {
                        $('#sbtbtn').attr('disabled', 'disabled');
                    }
                });
            });
       
      
            $(document).ready(function () {

                $(function () {
                    $('#sbtbtn2').attr('disabled', 'disabled');
                });
                var regex = /^[a-zA-Z0-9 ]*$/;
                $('input[type=text],input[type=password],input[type=select]').keyup(function () {

                    if ($('#prcategory').val() != '' &&
                            $('#psc').val() != '' && regex.test($('#psc').val())) {

                        $('#sbtbtn2').removeAttr('disabled');
                    } else {
                        $('#sbtbtn2').attr('disabled', 'disabled');
                    }
                });
            });
   
   //Tender Category Area Of Work
   
            $(document).ready(function () {

                $(function () {
                    $('#sbtbtn').attr('disabled', 'disabled');
                });
                var regex = /^[a-zA-Z0-9 ]*$/;
                $('input[type=text],input[type=password],input[type=select]').keyup(function () {

                    if ($('#category_id').val() != '' &&
                            $('#areaofwork_name').val() != '' && regex.test($('#areaofwork_name').val())) {

                        $('#sbtbtn').removeAttr('disabled');
                    } else {
                        $('#sbtbtn').attr('disabled', 'disabled');
                    }
                });
            });
     
           
            $(document).ready(function () {

                $(function () {
                    $('#sbtbtn1').attr('disabled', 'disabled');
                });
                var regex = /^[a-zA-Z0-9 ]*$/;
                $('input[type=text],input[type=password],input[type=select]').keyup(function () {

                    if ($('#selectcategoryid').val() != '' && $('#areaofwork').val() != '' &&
                            $('#tenderkeywordid').val() != '' && regex.test($('#tenderkeywordid').val())) {

                        $('#sbtbtn1').removeAttr('disabled');
                    } else {
                        $('#sbtbtn1').attr('disabled', 'disabled');
                    }
                });
            });
      
// Country-state-City
 $(document).ready(function () {

            $(function () {
                $('#sbtbtn').attr('disabled', 'disabled');
            });
            var regex = /^[a-zA-Z0-9 ]*$/;
            $('input[type=text],input[type=password]').keyup(function () {

                if ($('#idcountry').val() != '' && regex.test($('#idcountry').val()))
                {

                    $('#sbtbtn').removeAttr('disabled');
                } else {
                    $('#sbtbtn').attr('disabled', 'disabled');
                }
            });
        });
    
  
        $(document).ready(function () {

            $(function () {
                $('#sbtbtn2').attr('disabled', 'disabled');
            });
            var regex = /^[a-zA-Z0-9 ]*$/;
            $('input[type=text],input[type=password],input[type=select]').keyup(function () {

                if ($('#countryid').val() != '' &&
                        $('#state_name').val() != '' && regex.test($('#state_name').val())) {

                    $('#sbtbtn2').removeAttr('disabled');
                } else {
                    $('#sbtbtn2').attr('disabled', 'disabled');
                }
            });
        });
  
        $(document).ready(function () {

            $(function () {
                $('#sbtbtn3').attr('disabled', 'disabled');
            });
            var regex = /^[a-zA-Z0-9 ]*$/;
            $('input[type=text],input[type=password],input[type=select]').keyup(function () {

                if ($('#count_id').val() != '' && $('#state_name2').val() != '' &&
                        $('#cityname').val() != '' && regex.test($('#cityname').val())) {

                    $('#sbtbtn3').removeAttr('disabled');
                } else {
                    $('#sbtbtn3').attr('disabled', 'disabled');
                }
            });
        });
//End---------- Country-state-City