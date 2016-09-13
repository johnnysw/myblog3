define(['jquery'], function($){
    $(function(){
        var bShow = false;
        $('#search-btn').on('click', function(){
            if(bShow){
                $('#search-box').animate({
                    width: 30
                }, function(){
                    $('#search-input').hide()
                });
            }else{
                $('#search-box').animate({
                    width: 400
                });
                $('#search-input').show();
            }
            bShow = !bShow;
        });
    });
});