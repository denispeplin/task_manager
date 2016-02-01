/* globals setFileupload: true */

setFileupload = function() {
  $("#task_form").fileupload({
    dataType: "script",
    singleFileUploads: false
  });
};

$(document).on("ready page:change", setFileupload);
