// Frequently used Google apps
define_webjump("image", "http://images.google.com/images?q=%s");
define_webjump("mail", "https://gmail.com");
define_webjump("reader", "http://google.com/reader");
define_webjump("calendar", "http://google.com/calendar");
define_webjump("maps", "http://maps.google.com/?q=%s");
define_webjump("youtube", "http://www.youtube.com/results?search_query=%s",
               $alternative = "http://www.youtube.com");
define_webjump("scholar", "http://scholar.google.com/scholar?q=%s");

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
define_webjump("compgenwiki",
               "http://compgen.unc.edu/wiki/index.php/Special:Search?search=%s",
               $alternative = "http://compgen.unc.edu/wiki");

// Useful lookups
define_webjump("archwiki", 
               "https://wiki.archlinux.org/index.php/Special:Search?search=%s", 
               $alternative = "https://wiki.archlinux.org/");
define_webjump("aur", "https://aur.archlinux.org/packages.php?K=%s",
               $alternative = "https://aur.archlinux.org");
define_webjump("emacswiki",
               "http://www.google.com/cse?cx=004774160799092323420%3A6-ff2s0o6yi" +
               "&q=%s&sa=Search&siteurl=emacswiki.org%2F",
               $alternative="http://www.emacswiki.org/");
define_webjump("ggplot2",
               "http://www.google.com/cse?cx=001874040508206079260%3Azzkysoltlo0&ie=UTF-8&q=%s",
               $alternative="http://had.co.nz/ggplot2/");
define_webjump("javadoc",
               "http://www.google.com/search?q=%s " +
               "site=download.oracle.com/javase/6/docs/api");
define_webjump("pydoc",
               "http://docs.python.org/py3k/search.html?q=%s",
               $alternative="http://docs.python.org/py3k");
define_webjump("conkerorwiki",
               "http://conkeror.org/?action=fullsearch&context=60" +
               "&value=%s&fullsearch=Text",
               $alternative="http://conkeror.org");
