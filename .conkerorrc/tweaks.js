register_user_stylesheet("file:///home/asarkar/.conkerorrc/content.css");

homepage = "http://cs.unc.edu/~asarkar";

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
hints_display_url_panel = true;

// External editor
editor_shell_command = "emacsclient -c";
view_source_use_external_editor = true;

// Noscript convenience functions
require("noscript");

// Page modes
require("page-modes/gmail.js");
