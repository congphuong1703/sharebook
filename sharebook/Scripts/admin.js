$(document).ready(function () {
    $("#addTagBtn").click(function () {
        $('#tag-text').val('');
    });
    $("#addTag").click(function () {
        var tagName = $('#tag-text').val();
        if (tagName.trim() == "") {
            alert("Điền đầy đủ thông tin tên nhãn");
        } else {
            $.ajax({
                url: '/api/Manage/saveTag',
                method: 'POST',
                dataType: 'json',
                data: { "": tagName },
                success: function () {
                    alert("Thêm mới thành công thành công");
                    $('#exampleModalCenter').modal('hide');
                },
                error: function (xhr, err) {
                    alert(xhr.responseText);
                }
            });
        }
    });

    
});