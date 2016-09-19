require(['jquery', 'search'], function($){
    $(function(){
        var iOffset = 0;
        var $blogList = $('#blog-list ul');
        $('#btn-more').on('click', function(){
            var that = this;
            $(this).hide();
            setTimeout(function(){
                $.get('welcome/get_more',{
                    offset: iOffset+=6
                },function(data){
                    var html = '';
                    for(var i=0; i<data.length; i++){
                        var blog = data[i];
                        html += `<li><img src="`+blog.img+`" alt="">

                                <p class="desc">`+blog.blog_id+` - `+blog.content+`</p>

                                <p class="info">
                                <a href="#" class="read">READ</a>
                                </p>
                            </li>`;
                    }
                    $blogList.append(html);
                    $(that).show();
                }, 'json');
            }, 2000);
        });
    });
});