register_user_stylesheet("file:///home/asarkar/.conkerorrc/content.css");

homepage = "https://mail.google.com";

can_kill_last_buffer = false;

// External links
url_remoting_fn = load_url_in_new_buffer;

// Download buffer
download_buffer_automatic_open_target = OPEN_NEW_BUFFER;

// Modeline
remove_hook("mode_line_hook", mode_line_adder(clock_widget));

// Hints
hint_digits = "asdfqwer";
hint_background_color = "#ececec";
active_hint_background_color = "#e0e0ff";
image_hint_background_color = "#ececec";
active_image_hint_background_color = "#d0d0ff";
hints_minibuffer_annotation_mode(true);

// External editor
editor_shell_command = "emacsclient -c";
view_source_use_external_editor = true;

// Noscript convenience functions
require("noscript");

// Page modes
require("gmail.js");
require("google-voice.js");

// Proxy settings
interactive("proxy-activate",
            "Activate SOCKS proxy on localhost:8080",
            function (I) {
                session_pref('network.proxy.socks', 'localhost');
                session_pref('network.proxy.socks_port', 8080);
                session_pref('network.proxy.type', 1);
            });

interactive("proxy-deactivate",
            "Deactivate SOCKS proxy",
            function(I) {
                session_pref('network.proxy.type', 0);
            });
