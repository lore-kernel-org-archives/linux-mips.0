Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199807161853.LAA91562@oz.engr.sgi.com>
Subject: apache and other problems (fwd)
Date: Thu, 16 Jul 1998 11:53:34 -0700 (PDT)
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19980716185334.4eg5wb7vtxUfwjrzUD9_JJlNwZuuz_erNxuTOEmB9kw@z>

[forwarding bounced message]

----- Forwarded message from owner-linux@cthulhu -----
From: "Francis M.J. Hsieh" <mjhsieh@life.nthu.edu.tw>
To: linux@cthulhu.engr.sgi.com
Subject: Re: The pre-release of Hard Hat Linux for SGI...
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-Mailer: Mutt 0.79e
In-Reply-To: <Pine.LNX.3.95.980714192038.7212G-100000@lager.engsoc.carleton.ca>; from Alex deVries on Tue, Jul 14, 1998 at 07:38:32PM -0400

On Tue, Jul 14, 1998 at 07:38:32PM -0400, Alex deVries wrote:
> Enjoy, and let me know if you do have the bandwidth do download and use
> it.

This two files were uploaded in ftp://helix.life.nthu.edu.tw/pub/
(yes, it is a Linux/SGI machine) for people in Taiwan save their
download time.

I got some problem here.

- apache httpd is still buggy (can't deliver text/html correctly)

- ifconfig is still buggy, TX packets is 0 (see followed)

| [root@helix /root]# ifconfig
| lo        Link encap:Local Loopback
|           inet addr:127.0.0.1  Bcast:127.255.255.255  Mask:255.0.0.0
|           UP LOOPBACK RUNNING  MTU:3584  Metric:1
|           RX packets:27 errors:0 dropped:0 overruns:0
|           TX packets:0 errors:1962 dropped:27 overruns:0
|
| eth0      Link encap:Ethernet  HWaddr 08:00:69:08:BD:9A
|           inet addr:140.114.98.34  Bcast:140.114.98.255  Mask:255.255.255.0
|           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
|           RX packets:157929 errors:0 dropped:0 overruns:0
|           TX packets:0 errors:0 dropped:72422 overruns:0
|           Interrupt:3

- mouse doesn't work?


-- 
Francis M. J. Hsieh      | Email:   mjhsieh@life.nthu.edu.tw
Life Science Department, | Webpage: http://www.life.nthu.edu.tw/~mjhsieh/
National Tsing Hua Univ, | Voice:   +886 3 5715131 ext 3482
HsinChu, Taiwan Republic | 	    +886 3 5715649

----- End of forwarded message from owner-linux@cthulhu -----

-- 
Peace, Ariel
