$TTL 2d
;$ORIGIN example.com.
@         IN      SOA   ns1.example.com. hostmaster.example.com. (
                                2003080800 ; serial number
                                12h        ; refresh
                                15m        ; update retry
                                3w         ; expiry
                                2h         ; minimum
                                )
           IN      NS      ns1.example.com.
           IN      NS      ns2.example.net.
ns1        IN      A       192.168.254.2
mail       IN      A       192.168.254.4
www        IN      A       10.2.2.4
