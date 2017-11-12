require("content-policy.js");

var my_whitelist = {};
// Scripts
my_whitelist[2] = [
    "google.com",
    "gstatic.com",
    "maps.googleapis.com",
    "mit.edu",
    "uchicago.edu",
];
// XMLHTTPRequest
my_whitelist[11] = [
    "google.com",
];

function whitelist(type, location, origin, ...args) {
    dumpln(`*** Checking ${type} ${location.host} ${origin.host}`)
    if (type in my_whitelist &&
        my_whitelist[type].map(x => String.endsWith(location.host, x)).some(x => x) &&
        String.endsWith(origin.host, location.host)) {
        dumpln('Accepting')
        return content_policy_accept;
    }
    else {
        dumpln('Rejecting')
        return content_policy_reject;
    }
}

content_policy_bytype_table.script = whitelist;
content_policy_bytype_table.ping = () => content_policy_reject;
content_policy_bytype_table.font = () => content_policy_reject;
content_policy_bytype_table.xmlhttprequest = whitelist;
content_policy_bytype_table.media = () => content_policy_reject;

add_hook("content_policy_hook", content_policy_bytype);

define_key(content_buffer_normal_keymap, "f2", "content-policy-toggle");
