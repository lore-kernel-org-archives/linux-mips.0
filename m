From: "Craig Mautner" <craig.mautner@alumni.ucsd.edu>
Subject: RE: schedule() BUG
Date: Sat, 13 Sep 2003 09:30:29 -0700
Message-ID: <JKEMLDJFFLGLICKLLEFJGEFECOAA.craig.mautner@alumni.ucsd.edu>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-reply-to: <JKEMLDJFFLGLICKLLEFJMEEOCOAA.craig.mautner@alumni.ucsd.edu>
Return-Path: <craig.mautner@alumni.ucsd.edu>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030913163029.6zyYyNDNwVa0Nkmp20y5grOYh0xoJcOdY_HoB6CDnLQ@z>

Regarding my previous posting, we had made the assumption that schedule()
could be called from an interrupt that occured within schedule(). However,
because schedule() is in the kernel, ret_from_irq will skip over the call to
schedule() and simply restore the context.

-Craig

-.     .-.     .-_     Craig Mautner
  \   /   \   / / `    Coastal Sr. Consulting, Inc.
   `-'     `-'  `---   (858)361-2683
                       (858)581-0542 (fax)
5580 La Jolla Blvd. #308 La Jolla, CA 92037
mailto:craig.mautner@alumni.ucsd.edu
http://home.san.rr.com/cmautner/csc/craig/
