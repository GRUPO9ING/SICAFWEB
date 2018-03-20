$.fn.search = function() {
    return this.focus(function() {
        if (this.value == this.defaultValue) {
            this.value = "";
        }
    }).blur(function() {
        if (!this.value.length) {
            this.value = this.defaultValue;
        }
    });
};
$("#email").search();

$("#subscribeform").validate({
    errorElement: "div",
    errorPlacement: function(error, element) {
        error.insertBefore($("#desc"));
    },
    rules: {
        email: {
            email: true
        },
    },
    messages: {
        name: "Please specify your name",
        email: {
            email: "Please enter a valid email address."
        }
    }
});
