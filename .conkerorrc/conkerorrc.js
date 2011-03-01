register_user_stylesheet("file:///home/asarkar/.conkerorrc/content.css");

homepage = "http://cs.unc.edu/~asarkar";

define_webjump("mail", "https://gmail.com");
define_webjump("reader", "http://google.com/reader");
define_webjump("calendar", "http://google.com/calendar");
// define_webjump("youtube", 
//                "http://www.youtube.com/results?search_query=%s&search=Search");
define_webjump("hacker_news", 
               "http://www.google.com/search?q=site:news.ycombinator.com+%s",
               $alternative = "http://news.ycombinator.com/");
define_webjump("twitter", "https://twitter.com");
define_webjump("facebook", "https://facebook.com");
define_webjump("nytimes", "http://nytimes.com");
define_webjump("guardian", "http://guardian.co.uk");
define_webjump("xkcd", "http://m.xkcd.com");
define_webjump("comp431", "http://www.cs.unc.edu/~jeffay/courses/comp431/");
define_webjump("comp790", "http://cs.unc.edu/Courses/comp790-090-s11/");

url_remoting_fn = load_url_in_new_buffer;

remove_hook("mode_line_hook", mode_line_adder(clock_widget));

hint_digits = "asdfqwer";
hint_background_color = "#ececec";
active_hint_background_color = "#e0e0ff";
image_hint_background_color = "#ececec";
active_image_hint_background_color = "#d0d0ff";
hints_display_url_panel = true;

editor_shell_command = "emacsclient -c";
view_source_use_external_editor = true;

can_kill_last_buffer = false;

require("page-modes/gmail.js");
google_search_bind_number_shortcuts();
require("page-modes/twitter.js");

require("noscript");

browser_prevent_automatic_form_focus_mode(true);

download_buffer_automatic_open_target = OPEN_NEW_BUFFER;
