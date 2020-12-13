

        $(document).ready(function () {

            var cirregex = new RegExp(
                    '^(([a-zA-Z0-9]+$))'
                    );

            var divregex = new RegExp(
                    '^(([a-zA-Z0-9 ]+$))'
                    );

            var subdivregex = new RegExp(
                    '^(([a-z\s]+$))'
                    );

            var nitshortregex = new RegExp(
                    '^(([a-z\s]+$))'
                    );

            var nitnoworkregex = new RegExp(
                    '^(([a-z\s]+$))'
                    );

            var nitpacregex = new RegExp(
                    '^(([a-z\s]+$))'
                    );

            var nitpacwregex = new RegExp(
                    '^(([a-z\s]+$))'
                    );

            var nitemdregex = new RegExp(
                    '^(([a-z\s]+$))'
                    );

            var nitemdwregex = new RegExp(
                    '^(([a-z\s]+$))'
                    );

            var nitfeewregex = new RegExp(
                    '^(([a-z\s]+$))'
                    );

            var updateregex = new RegExp(
                    '^(([a-zA-Z0-9 ]+$))'
                    );

            var updatesubregex = new RegExp(
                    '^(([a-zA-Z0-9 ]+$))'
                    );

            var emailregex = new RegExp(
                    '^(([^<>()[\\]\\\\.,;:\\s@\\"]+(\\.[^<>()[\\]\\\\.,;:\\s@\\"]+)*)|' +
                    '(\\".+\\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])' +
                    '|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$'
                    );

            $('#Cir input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', cirregex.test($(this).val()));
            });

            $('#DIV input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', divregex.test($(this).val()));
            });

            $('#SubDiv input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', subdivregex.test($(this).val()));
            });

            $('#short textarea').on('keyup', function (e) {
                $(this).parent().toggleClass('success', nitshortregex.test($(this).val()));
            });

            $('#Nowork input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', nitnoworkregex.test($(this).val()));
            });

            $('#pac input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', nitpacregex.test($(this).val()));
            });

            $('#pacW input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', nitpacwregex.test($(this).val()));
            });

            $('#emd input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', nitemdregex.test($(this).val()));
            });

            $('#emdW input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', nitemdwregex.test($(this).val()));
            });

            $('#fee input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', nitfeewregex.test($(this).val()));
            });

            $('#feeW input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', nitfeewregex.test($(this).val()));
            });

            $('#timeP input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', nitfeewregex.test($(this).val()));
            });



            $('#upd input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', updateregex.test($(this).val()));
            });

            $('#updsub input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', updatesubregex.test($(this).val()));
            });

            $('#cirCle  select').on('change', function (e) {
                // alert($('#circle1').val());
                if ($('#circle1').val() !== '') {
                    // alert($(this).val());
                    $(this).parent().toggleClass('success', true);
                } else {
                    $(this).parent().toggleClass('success', false);

                }

            });

            $('#AddcirclE  select').on('change', function (e) {
                // alert($('#circle1').val());
                if ($('#circle10').val() !== '') {
                    // alert($(this).val());
                    $(this).parent().toggleClass('success', true);
                } else {
                    $(this).parent().toggleClass('success', false);

                }

            });
            $('#AdddivisioN select').on('change', function (e) {

                if ($('#division1').val() !== '') {

                    $(this).parent().toggleClass('success', true);
                } else {

                    $(this).parent().toggleClass('success', false);

                }
            });


            $('.email input').on('keyup', function (e) {
                $(this).parent().toggleClass('success', emailregex.test($(this).val()));
            });

        });

    
//  product category Sub category
            $(document).ready(function () {

                var pcatregex = new RegExp(
                        '^(([a-zA-Z0-9]+$))'
                        );

                var divregex = new RegExp(
                        '^(([a-zA-Z0-9 ]+$))'
                        );

                var subdivregex = new RegExp(
                        '^(([a-zA-Z0-9 ]+$))'
                        );



                $('#Pcate input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', pcatregex.test($(this).val()));
                });

                $('#Pscat input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', divregex.test($(this).val()));
                });

                $('#Upscat input').on('keyup', function (e) {
                    $(this).parent().toggleClass('success', subdivregex.test($(this).val()));
                });

                $('#AddprosubcaT select').on('change', function (e) {

                    if ($('#prcategory').val() !== '') {

                        $(this).parent().toggleClass('success', true);
                    } else {

                        $(this).parent().toggleClass('success', false);

                    }
                });

            });

         //country state city
        
         $(document).ready(function() {
           

    var counaddregex = new RegExp(
        '^(([a-zA-Z0-9 ]+$))'
    );

    var stateregex = new RegExp(
        '^(([a-zA-Z0-9 ]+$))'
    );
    
    var cityregex = new RegExp(
        '^(([a-z\s]+$))'
    );
    
    
   $('#counSelect select').on('change', function (e) {

                    if ($('#countryid').val() !== '') {

                        $(this).parent().toggleClass('success', true);
                    } else {

                        $(this).parent().toggleClass('success', false);

                    }
                });
                
                 $('#selectCoun select').on('change', function (e) {

                    if ($('#count_id').val() !== '') {

                        $(this).parent().toggleClass('success', true);
                    } else {

                        $(this).parent().toggleClass('success', false);

                    }
                });
           
                
                 $('#selectState select').on('change', function (e) {

                    if ($('#state_name2').val() !== '') {

                        $(this).parent().toggleClass('success', true);
                    } else {

                        $(this).parent().toggleClass('success', false);

                    }
                });
                

    $('#CounAdd input').on('keyup', function(e) {
        $(this).parent().toggleClass('success', counaddregex.test($(this).val()));
    });

    $('#sta input').on('keyup', function(e) {
        $(this).parent().toggleClass('success', stateregex.test($(this).val()));
    });
    
    $('#cit input').on('keyup', function(e) {
        $(this).parent().toggleClass('success', cityregex.test($(this).val()));
    });
    
    
});

//Tender Category Area Of Work

 $(document).ready(function() {
            

    var areaWorkregex = new RegExp(
        '^(([a-zA-Z0-9 ]+$))'
    );
    
     var keyWregex = new RegExp(
        '^(([a-zA-Z0-9 ]+$))'
    );
    
     $('#selectCat select').on('change', function (e) {

                    if ($('#selectcategoryid').val() !== '-1') {

                        $(this).parent().toggleClass('success', true);
                    } else {

                        $(this).parent().toggleClass('success', false);

                    }
                });
               
                 
     $('#selectTendercat select').on('change', function (e) {

                    if ($('#category_id').val() !== '-1') {

                        $(this).parent().toggleClass('success', true);
                    } else {

                        $(this).parent().toggleClass('success', false);

                    }
                });
                
                $('#selectAreawork select').on('change', function (e) {

                    if ($('#areaofwork').val() !== '-1') {

                        $(this).parent().toggleClass('success', true);
                    } else {

                        $(this).parent().toggleClass('success', false);

                    }
                });
                
    
    $('#areaWork input').on('keyup', function(e) {
        $(this).parent().toggleClass('success', areaWorkregex.test($(this).val()));
    });
 
  
    $('#keyW input').on('keyup', function(e) {
        $(this).parent().toggleClass('success', keyWregex.test($(this).val()));
    });
  });