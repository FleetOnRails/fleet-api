Geocoder.configure(

    # geocoding service (see below for supported options):
    #:lookup => :yandex,

    # IP address geocoding service (see below for supported options):
    #:ip_lookup => :maxmind,

    # geocoding service request timeout, in seconds (default 3):
    :timeout => 2,

    # set default units to kilometers:
    :units => :km,

    # caching (see below for details):
    #:cache => Redis.new,
    #:cache_prefix => 'geo',

    #:yandex => {
    #    #:api_key => '',
    #    :timeout => 5
    #},
    #
    #:maxmind => {
    #    #:api_key => '',
    #    :service => :omni
    #}

)