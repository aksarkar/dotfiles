// Frequently used Google apps
define_webjump("calendar", "https://www.google.com/calendar");
define_webjump("drive", "https://drive.google.com");
define_webjump("image", "https://images.google.com/images?q=%s");
define_webjump("mail", "https://mail.google.com");
define_webjump("maps", "https://maps.google.com/?q=%s");
define_webjump("youtube", "https://www.youtube.com/results?search_query=%s",
               $alternative="https://www.youtube.com");
define_webjump("scholar", "https://scholar.google.com/scholar?q=%s");

// Frequently read
define_webjump("economist", "http://www.economist.com/");
define_webjump("guardian", "http://www.theguardian.com/us?view=mobile");
define_webjump("jacobin", "http://jacobinmag.com");
define_webjump("nlr", "https://newleftreview.org/");
define_webjump("nytimes", "http://mobile.nytimes.com");
define_webjump("spiegel", "https://www.spiegel.de/international/");
define_webjump("tor", "http://www.tor.com/");
define_webjump("weather", "http://openweathermap.org/city/4930956");
define_webjump("mta-reservation", 
               "https://docs.google.com/spreadsheet/embeddedform?formkey=dExKOWpRWmxsR1ZIMVhRNlVZQ2ZxVmc6MQ");

// Social networks
define_webjump("github", "https://github.com");
define_webjump("bitbucket", "https://bitbucket.org");

// Research
define_webjump("bioinformatics", "http://bioinformatics.oxfordjournals.org/");
define_webjump("compbiowiki", "https://groups.csail.mit.edu/compbio/wiki/");
define_webjump("encodewiki", "http://wiki.encodedcc.org/");
define_webjump("gr", "http://genome.cshlp.org/");
define_webjump("nature", "http://www.nature.com/nature/");
define_webjump("nbt", "http://www.nature.com/nbt/");
define_webjump("ng", "http://www.nature.com/ng/");
define_webjump("science", "https://sciencemag.org");

// Useful lookups
define_webjump("archwiki", 
               "https://wiki.archlinux.org/index.php/Special:Search?search=%s", 
               $alternative="https://wiki.archlinux.org/");
define_webjump("aur", "https://aur.archlinux.org/packages.php?K=%s",
               $alternative="https://aur.archlinux.org");
define_webjump("oed", "http://oed.com/search?searchType=dictionary&q=%s");
