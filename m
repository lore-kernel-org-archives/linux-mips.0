Received: from PEPELEPEW ([172.30.1.10]) by ns.pioneer-pdt.com
          (Post.Office MTA v3.5.3 release 223 ID# 0-68491U100L2S100V35)
          with SMTP id com for <linux-mips@linux-mips.org>;
          Mon, 15 Sep 2003 12:03:36 -0700
From: craig.mautner@pioneer-pdt.com (Craig Mautner)
Subject: RE: schedule() BUG
Date: Mon, 15 Sep 2003 11:59:50 -0700
Message-ID: <JKEMLDJFFLGLICKLLEFJKEFNCOAA.craig.mautner@pioneer-pdt.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-reply-to: <JKEMLDJFFLGLICKLLEFJMEEOCOAA.craig.mautner@alumni.ucsd.edu>
Return-Path: <craig.mautner@pioneer-pdt.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030915185950.1H1PYPpg207Q0j_Hwd2qLmR5SUyuIrLYL0rCW6Acoqs@z>

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
