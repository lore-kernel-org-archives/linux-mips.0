Message-ID: <012b01bfaaeb$27911800$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: Should send SIGFPE to .*
Date: Thu, 20 Apr 2000 19:09:07 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Florian Lohoff <flo@rfc822.org>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <20000420170907.Epyj8-LBkRBumJLDzvhPJajCNikXTmQzKfarTcMQpPA@z>

>> if it was actually a problem), and as such the force_sig() should
>> use the value returned by compute_return_epc() as the signal
>
>I dont think compute_return_epc returns a signal value.

Oops.  You're right.  It returns -EFAULT.  And it handles
the signal propagation all by its lonesome, so nothing
further needs to be done if it failed.

>> I was going to make another cleanup pass over traps.c this
>> week, so it looks like you've found me another nit to excise.
>> (Although we've got the full-blown Algorithmics emulator
>> in our source base - coming soon to a repository near you -
>> we kept the old stuff around for people wanting to build for
>> a minimal footprint).
>
>How much is the full emulator as binary ?

About 47Kbytes, I'm afraid.


__

Kevin D. Kissell
MIPS Technologies European Architecture Lab
kevink@mips.com
Tel. +33.4.78.38.70.67
FAX. +33.4.78.38.70.68
