Return-Path: <owner-linux@cthulhu.engr.sgi.com>
From: ariel@oz.engr.sgi.com (Ariel Faigon)
Message-ID: <199901211833.KAA51826@oz.engr.sgi.com>
Subject: Re: 2.2pre9 has VW support
Date: Thu, 21 Jan 1999 10:33:14 -0800 (PST)
In-Reply-To: <m367a078bd.fsf@chuck.sv.usweb.com> from "Jeff Coffin" at Jan 21, 99 11:08:22 am
Reply-To: ariel@cthulhu.engr.sgi.com (Ariel Faigon)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: owner-linux@cthulhu.engr.sgi.com
To: Jeff Coffin <jcoffin@sv.usweb.com>
Cc: linux@cthulhu.engr.sgi.com
Message-ID: <19990121183314.jauB8zH1crXZEazlD9uj60NqQ9mTR0lPH_rI1laPECs@z>

:
:So I suppose some of you have seen this, but do any SGI folks care to
:comment knowledgeably?
:
:http://www.slashdot.org/articles/99/01/21/0727205.shtml
:
:http://edge.linuxhq.com/changelist.cgi?show=2.2.0pre9
:

I guess I can comment on this.

Bent Hagemark (an SGI engineer) figured out how to boot
Linux on the VisWS, including recognizing the low level
hardware, wrote the patch, emailed it to Ingo Molnar
for review and comments, Ingo made some minor changes
to better fit in the scheme of things, sent it to Linus,
and there we have it in the official Linux tree :-)

Please note that this only enables booting the VisWS
multi user and it doesn't yet have accelerated graphics
support as Ken Klingman said before.  I'm sure Ken
can add more information and correct me where I'm wrong.

-- 
Peace, Ariel
