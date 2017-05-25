ipify [![Travis-CI Build Status](https://travis-ci.org/gregce/ipify.svg?branch=master)](https://travis-ci.org/gregce/ipify)
---------------------------------------------------------------------------------------------------------------------------

> Get your public IP

Using the [`ipify` API](https://www.ipify.org) by
[Rdegges](https://github.com/rdegges)

Installation and Documentation
------------------------------

You can install the R `ipify` package using
[devtools](https://github.com/hadley/devtools):

    library(devtools)
    install_github("gregce/ipify")

Usage
-----

    library(ipify)
    get_ip()

    ## No encoding supplied: defaulting to UTF-8.

    ## [1] "4.16.47.226"

    get_ip(format="json")

    ## $ip
    ## [1] "4.16.47.226"

    get_ip(format="jsonp")

    ## No encoding supplied: defaulting to UTF-8.

    ## [1] "callback({\"ip\":\"4.16.47.226\"});"

License
-------

[MIT](https://opensource.org/licenses/MIT) @ [Greg
Ceccarelli](https://www.linkedin.com/in/gregceccarelli)
