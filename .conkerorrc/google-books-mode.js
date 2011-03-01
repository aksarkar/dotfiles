define_keymap("google-books-mode-keymap", 
              $parent=content_buffer_normal_keymap);
define_key(google-books-mode-keymap, "j", null, $fallthrough);
define_key(google-books-mode-keymap, "k", null, $fallthrough);
define_key(google-books-mode-keymap, "page_up", null, $fallthrough);
define_key(google-books-mode-keymap, "page_down", null, $fallthrough);
define_key(google-books-mode-keymap, "space", null, $fallthrough);

define_page_mode("google-books-mode", "Google Books");

let (re = build_url_regex($domain="books.google")) {
    auto_mode_list.push([re, google-books-mode]);
};

