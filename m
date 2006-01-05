Received: from ltrxmail.lantronix.com ([67.134.254.86]:10821 "EHLO
	double-bogey.int.lantronix.com") by ftp.linux-mips.org with ESMTP
	id S8133546AbWAEQMo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Thu, 5 Jan 2006 16:12:44 +0000
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: iptables/vmalloc issues on alchemy (revisited)
Date: Thu, 5 Jan 2006 08:15:13 -0800
Message-ID: <2F0FC2A92C0B154BB406D5E74CB3E693010849F5@3putt.int.lantronix.com>
From: "Christi Garvin" <christi.garvin@lantronix.com>
Return-Path: <christi.garvin@lantronix.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Cc: dan@embeddededge.com
Message-ID: <20060105161513.YclmMaetwNPkiZeTH3DiN5fi3iLsx3i5Q13tAvW3c5M@z>

This issue was reported on this mailing list back in April '05....
 
On Tue, 2005-04-26 at 10:43 +0200, Herbert Valerio Riedel wrote:
> ... 
> The problem seems to be so far, that when modifying the iptables
> structures by adding/flushing the rules, a state can be reached sooner
> or later (indeterministic! smells like race) where the data structure
> becomes invalid (although there are checks in the kernel which would
> prevent that); the result is either ip_tables.c:ipt_do_tables() causing
> an oops due to bad pointer dereferencing (or the kernel freezing w/o
> further notice at all), or the iptables tool being unable to
> retrieve/modify the rules from the kernel (and getting ENOMEM/EINVAL) or
> simply segfaulting due to other inconsistencies with the data...
it appears the problem was found...
On Wed, 2005-04-27 at 15:06 -0400, Dan Malek wrote:
> Oh wait ....  I found a bug a while ago from someone trying to load
> large modules.  There is a problem if the kernel grows to need
> additional PTE tables, the top level pointers don't get propagated
> correctly and subsequent access by a thread that didn't actually
> do the allocation would fail.  I'm looking into this, including your
> past message about 64-bit PTEs.
 
and possibly fixed:
 
> From: Dan Malek [mailto:dan@embeddededge.com] 
> Sent: Thursday, April 28, 2005 3:57 PM
> Subject: Re: iptables/vmalloc issues on alchemy
>
> I've just been talking about 2.6, so "long time ago" can't be
> that long :-)  I have the updates to the exception handler so
> the PTEs get loaded correctly, that's on the way.  I think 2.4
> should be OK if anyone is using that.
 
I am encountering this same problem with 2.6.11 and iptables 1.2.11, 
and I've searched for an appropriate patch/fix, and cannot find one....
Can you tell me if this has been fixed, and if so, point me in the
direction of the patch?
 
regards,
christi garvin
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the person or entity to which it is addressed and may contain information that is privileged, confidential, or otherwise protected from disclosure. Distribution or copying of this e-mail, or the information contained herein, to anyone other than the intended recipient is prohibited.
