
<script>
var format = function (str, data) {
    var html = '';
    if (data instanceof Array) {
        for (var i = 0, len = data.length; i < len; i++) {
            html += arguments.callee(str, data[i]);
        }
        return html;
    } else {
        return str.replace(/{#(\w+)#}/g, function (match, key) {
            return typeof data === 'string' ? data : (typeof data[key] === 'undefined' ? '' : data[key]);
        });
    }
};
</script>