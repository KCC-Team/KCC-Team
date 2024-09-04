$(document).ready(function () {
    let actionForm = $("#actionForm");
    $(".paginate_button a").on("click",function(e) {
         let queryString = window.location.search;
         let queryParams = new URLSearchParams(queryString);
         let title = queryParams.get('title');

         e.preventDefault();
         actionForm.find( "input[name='pageNum']").val($(this).attr("href") );

         if (title != null && title != '') {
             actionForm.find( "input[name='title']").val(title);
             actionForm.attr("action","/search");
         }

         actionForm.submit();
    });
});