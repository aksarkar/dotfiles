// Frequently used Google apps
define_webjump("mail", "https://gmail.com");
define_webjump("reader", "http://google.com/reader");
define_webjump("calendar", "http://google.com/calendar");
define_webjump("maps", "http://maps.google.com/?q=%s");
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
define_webjump("aur", "https://aur.archlinux.org/packages.php?K=%s",
               $alternative = "https://aur.archlinux.org");
define_webjump("emacswiki",
               "http://www.google.com/cse?cx=004774160799092323420%3A6-ff2s0o6yi" +
               "&q=%s&sa=Search&siteurl=emacswiki.org%2F",
               $alternative="http://www.emacswiki.org/");
define_webjump("javadoc",
               "http://www.google.com/search?q=%s " +
               "site=download.oracle.com/javase/6/docs/api");
define_webjump("conkerorwiki",
               "http://conkeror.org",
               $alternative="http://conkeror.org/?action=fullsearch&context=60" +
               "&value=%s&fullsearch=Text");
