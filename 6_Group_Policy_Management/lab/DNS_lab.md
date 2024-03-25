# Preventing Users from Accessing Certain Websites on all Browsers
- Go to Server Manager and click tools and select DNS.
- Double click your domain and right click Forward Lookup Zone and click new.
- Zone should be Primary here. Other options are secondary and stub zone. Primary zone creates a copy of the zone on the server. Secondary creates a copy of a zone that exists on another server. Stub zone creates a copy that contains NS, SOA and A records.
- Then chose how you want the data to be replicated: to all the DNS servers on the domain controllers in the forest/domain or all the domain controllers in this domain. Go with domain here.
- Give a zone name. Here we are giving facebook.com
- Next click on **Do not allow dynamic updates** or whichever option suits your needs.
- Right click on the zone that was created and click on new Host: A or AAAA (since we want to map ip address to the zone)
- The IP here should be loopback address because we do not want users to access this website. Instead it should get redirected to computer's own IP.
- Now when you try to ping facebook.com, it will actually ping the loopback address.
