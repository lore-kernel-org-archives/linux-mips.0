Date: Thu, 14 Dec 2000 19:30:12 +0100 (MET)
From: Karel van Houten <K.H.C.vanHouten@research.kpn.com>
Subject: Re: Cannot type on DECstation prom
In-reply-to: <20001214115451.A10322@web1.lanscape.net>
Message-ID: <200012141830.TAA01589@sparta.research.kpn.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Sender: owner-linux-mips@oss.sgi.com
Return-Path: <owner-linux-mips@oss.sgi.com>
To: Martin Michlmayr <tbm@lanscape.net>
Cc: linux-mips@oss.sgi.com
Message-ID: <20001214183012.cH2-SNLdJU9cVYJQSSndS1GMt0othoXAkF8z3k3Gr78@z>

> I recently got a DECstation 5000/125 and I'm trying to get Linux to run.
> I'm using minicom and while I get output from the machine, I can not
> type anything on the prom.  When I power the machine on, I get:
> 
> .....
> 
> The funny thing is that I _can_ type when NetBSD is being started.  But
> nothing happens on the prom.
> 

These DECStations require full modem control signals on the
prom console. I would build a D25 serial modem-faker cable:

 1 ------------------- 1

 2 -------\ /--------- 2
           X
 3 -------/ \--------- 3

 4 -+               +- 4
    |               |
 5 -+               +- 5

 6 -+               +- 6
    |               |
 7 -)---------------)- 7
    |               |
 8 -+               +- 8
    |               |
20 -+               +- 20

This should work.

-- 
Karel van Houten

----------------------------------------------------------
The box said "Requires Windows 95 or better."
I can't understand why it won't work on my Linux computer. 
----------------------------------------------------------
