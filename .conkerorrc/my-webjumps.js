// Frequently used Google apps
define_webjump("calendar", "http://www.google.com/calendar");
define_webjump("image", "http://images.google.com/images?q=%s");
define_webjump("mail", "https://mail.google.com");
define_webjump("maps", "http://maps.google.com/?q=%s");
define_webjump("youtube", "http://www.youtube.com/results?search_query=%s",
               $alternative="http://www.youtube.com");
define_webjump("scholar", "http://scholar.google.com/scholar?q=%s");

// Frequently read
define_webjump("economist", "http://www.economist.com/");
define_webjump("guardian", "http://m.guardiannews.com");
define_webjump("nytimes", "http://mobile.nytimes.com");
define_webjump("weather", "http://www.wunderground.com/us/ma/cambridge?sp=KMACAMBR9");

// Social networks
define_webjump("github", "https://github.com");

// Research
define_webjump("compbiowiki", "https://groups.csail.mit.edu/compbio/wiki/");
define_webjump("encodewiki", "http://wiki.encodedcc.org/");
define_webjump("impute2", "http://mathgen.stats.ox.ac.uk/impute/impute_v2.html");
define_webjump("shapeit2", "http://shapeit.fr");
define_webjump("ng", "http://www.nature.com/ng/");
define_webjump("nbt", "http://www.nature.com/nbt/");
define_webjump("nature", "http://www.nature.com/nature/");
define_webjump("science", "http://sciencemag.org");

// Useful lookups
define_webjump("archwiki", 
               "https://wiki.archlinux.org/index.php/Special:Search?search=%s", 
               $alternative="https://wiki.archlinux.org/");
define_webjump("aur", "https://aur.archlinux.org/packages.php?K=%s",
               $alternative="https://aur.archlinux.org");
define_webjump("dota2wiki", "http://www.dota2wiki.com/wiki/Special:Search?search=%s",
               $alternative="http://www.dota2wiki.com/wiki/Dota_2_Wiki")
define_webjump("emacswiki",
               "http://www.google.com/cse?cx=004774160799092323420%3A6-ff2s0o6yi" +
               "&q=%s&sa=Search&siteurl=emacswiki.org%2F",
               $alternative="http://www.emacswiki.org/");
define_webjump("ggplot2",
               "docs.ggplot2.org");
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
define_webjump("oed", "http://oed.com/search?searchType=dictionary&q=%s");
