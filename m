Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199709040253.TAA24709@oz.engr.sgi.com>
Subject: Re: Linux/SGI
Date: Wed, 3 Sep 1997 19:53:47 -0700 (PDT)
In-Reply-To: <340DF260.5D60941F@xtra.co.nz> from "Brendan Black" at Sep 4, 97 11:27:28 am
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Brendan Black <ratfink@xtra.co.nz>
Cc: SGI/Linux mailing list <linux@cthulhu.engr.sgi.com>
Message-ID: <19970904025347.B82GEG2aF9ULHKX82ysEP8qtGO1fdMJfASrl6dc_2wE@z>

:
:Hi
:
:we don't have a spare Indy to play with, but have a
:spare Challenge S (single processor R5000) 
:
:I was wondering if you thing this machine is possible, it would be 
:used with a serial console (no X), for testing ;)
:-- 

If you feel up to the challenge, sure, please go ahead.

There may be a few assumptions in the current code which detects
the newport graphics console that this testing may uncover. If 
you can fix this so it won't be Indy dependent, we win one more
possible platform !

Moreover, since a challenge-S doesn't have graphics anyway
Linux which is fast and compact may even outperform IRIX
on some benchmarks.

I would suggest that:

1) You join the mailing list:
	To: majordomo@engr.sgi.com
	Body: subscribe linux your@preferred.email.address
   if you have questions, ask...

2) If you have Challenge-S patches, e-mail them to the list
   and we can check that they didn't break anything and
   merge them into the source tree.

-- 
Peace, Ariel
