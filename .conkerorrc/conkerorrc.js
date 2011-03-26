register_user_stylesheet("file:///home/asarkar/.conkerorrc/content.css");

homepage = "http://cs.unc.edu/~asarkar";

// Frequently used Google apps
define_webjump("mail", "https://gmail.com");
define_webjump("reader", "http://google.com/reader");
define_webjump("calendar", "http://google.com/calendar");

// Frequently read
define_webjump("hacker_news", 
               "http://www.google.com/search?q=site:news.ycombinator.com+%s",
               $alternative = "http://news.ycombinator.com/");
define_webjump("nytimes", "http://nytimes.com");
define_webjump("guardian", "http://guardian.co.uk");
define_webjump("xkcd", "http://m.xkcd.com");

// Social networks
define_webjump("github", "https://github.com");
define_webjump("twitter", "https://twitter.com");
define_webjump("facebook", "https://facebook.com");

// School stuff
define_webjump("blackboard", "https://blackboard.unc.edu/webapps/login/");
define_webjump("compgenwiki",
               "http://compgen.unc.edu/wiki/index.php/Special:Search?search=%s",
               $alternative = "http://www.compgen.unc.edu/wiki");
define_webjump("431 ", "http://www.cs.unc.edu/~jeffay/courses/comp431/");
define_webjump("790 ", "http://cs.unc.edu/Courses/comp790-090-s11/");

// Useful lookups
define_webjump("archwiki", 
               "https://wiki.archlinux.org/index.php/Special:Search?search=%s", 
               $alternative = "https://wiki.archlinux.org/");
define_webjump("emacswiki",
               "http://www.google.com/cse?cx=004774160799092323420%3A6-ff2s0o6yi" +
               "&q=%s&sa=Search&siteurl=emacswiki.org%2F",
               $alternative="http://www.emacswiki.org/");
define_webjump("javadoc",
               "http://www.google.com/search?q=%s " +
               "site=download.oracle.com/javase/6/docs/api");

// External links
url_remoting_fn = load_url_in_new_buffer;

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

can_kill_last_buffer = false;

require("page-modes/gmail.js");

browser_prevent_automatic_form_focus_mode(true);

download_buffer_automatic_open_target = 1;
