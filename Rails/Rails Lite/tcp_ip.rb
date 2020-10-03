# Allows computers to pass data to eachother

# IP is made up of a set of rules for sending information from one computer to another.
# To that end, it handles both assigning addresses and routing information from a source to a target

# IP addresses
# An IP address is an identifier assigned to a computer that is connected to a TCP/IP network
# IPv4 has 32 bits
# IPv6 has 128 bits

# Packets
# The term "packet" refers to a formatted unit of data that contains,
# along with its payload, control information: data for delivering the payload.

# TCP
# TCP is a higher-level protocol running on top of IP.
# It provides applications with information delivered by IP,
# but provides additional work by ensuring that the information is reliable, ordered, and error-checked.
# TCP also breaks large pieces of information into packets (to be sent via IP)

# When running TCP, they do a Handshake
# This has a synchronize message and synchronize acknowledgment message
# After they handshake, they can send information to each other using TCP.

# TCP uses port numbers to identify application end points on a computer
# When interacting with other computers, some well-known ports include:
# 80, for HTTP; 20, for FTP; 22, for SSH; 25, for SMTP; 443, for HTTP over SSL.

# Application Layer
# The term "application layer" refers to the abstraction of a set of protocols
# and interfaces used by computers in a communications network -
# most generally, it describes applications that interact with TCP. Applications that implement protocols include:
# Telnet
# FTP
# SMTP
# DNS
# HTTP
# SSH