# DNS connects hostname (google.com) with correct ip address
# Operating system keeps a list of hostname websites that you have already been to

# Going to a website that you haven't been before:
# Must do a DNS query to find out where it lives
# It makes a DNS query to whatever address is specified in operating system settings
# Almost certainly from ISP

# DNS query to ISP ->
# DNS resolver ...
# DNS resolver figures it out and returns an answer
# It makes a series of queries to different servers to find out where google.com is
# It checks top level domain first ".com"

# If it doesn't know what .com is
# It makes a query to one of the root name servers
# Maintained by the Internet assigned number system, have different clusters around the world.
# They point to TLD nameservers
# The root nameserver says: "Here is .com"
# DNS resolver goes to the nameserver of .com, and asks "Where is google.com"
# The .com TLD nameserver says "I don't know where www.google.com is, but I know where google.com is"
# Here is google.com
# DNS resolver makes another request to google.com nameserver, and asks where is www.google.com is
# The DNS resolver gives back to the computer, the ip address of www.google.com

# Because of cacheing, the DNS resolver caches things, and so do the nameservers.
# So lookups are fast, and most of the time the lookup already stops at the DNS resolver from the ISP.
