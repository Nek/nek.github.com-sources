(function(window) {
    var moment = window.moment;   
    var nodes = document.getElementsByClassName("updated");
    var l = nodes.length;
    var i;
 
    function humanizeUpdated() {
        for (i = 0; i < l; i++) {
            var from = moment(nodes[i].attributes["data-updated"].value.replace('"','').replace('"','')).fromNow();
            var status = nodes[i].attributes["data-status"].value;    
            nodes[i].textContent = "This is a draft! It was updated " + from + ".";
        }
    }

    humanizeUpdated();

    window.setInterval(humanizeUpdated, 1000);
            
})(this)
