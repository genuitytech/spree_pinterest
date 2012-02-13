# Spree Pinterest

Simple Spree extension for adding a Pinterest ![Pin it](http://passets-cdn.pinterest.com/images/pinit_preview_horizontal.png) button for your
product images.  It will add the button below each image on the
`products#index` page and on the `products#show` page.

It has some
default styling that works with the default Spree theme, but you can
easily override this styling to fit your needs.

## Button parameters

There are three parameters that the button uses to create the pin:
_url_, _media_, and _description_.  The values used for each of these are
as follows:

* url - The URL of the page that the pin button is located on
* media - The URL for the image that is being pinned
* description - The product name

When you click the "Pin it" button, a Pinterest-provided window is
opened for you to confirm the pin.  Here you will have the opportunity
to choose your pin board, as well as modify the description if you don't
want to use the default.

## Testing this engine

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test app
    $ bundle exec rspec spec

Copyright (c) 2012 [Genuity Technology Services](http://genuitytech.com), released under the New BSD License
