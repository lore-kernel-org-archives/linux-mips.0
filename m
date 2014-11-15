Received: from relay1.mentorg.com ([192.94.38.131]:54428 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27013682AbaKOWHIB3Jhz (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 15 Nov 2014 23:07:08 +0100
Date: Sat, 15 Nov 2014 22:06:54 +0000
From: "Maciej W. Rozycki" <macro@codesourcery.com>
Subject: [PATCH 0/7] MIPS: Assorted microMIPS fixes
Message-ID: <alpine.DEB.1.10.1411140122420.2881@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej_Rozycki@mentor.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@linux-mips.org
Message-ID: <20141115220654.B-hpA3-sHwRjXgO7_6ijXoHtGeQsPmDsBzyqWKsbneA@z>

Hi,

 In an attempt to build a kernel that supports microMIPS userland and 
runs on QEMU I came across the problem that, due to apparently arbitrary 
decisions made sometime in the past, there is no such combination 
possible.

 I went ahead and fixed our configuration to support that, but in the 
course of doing that I came across numerous problems that I decided to 
address at the same time.  This mini patch series the result.  Most of 
the changes are actually independent of one another, although there is a 
syntactical overlap between 5/7 and 7/7, so these have to be applied in 
order.

 Of course I had to draw a line somewhere so as not to get distracted 
too much from the actual purpose I have the need to run such a 
configuration, so I left some further bugs I spotted for the next 
occasion.

 Ralf, please backport these fixes to stable branches as applicable; I 
can supply you with a 3.17 equivalent of 5/7 as this piece has changed 
significantly recently and I actually had to forward-port the original 
change that I made to address the issue.

  Maciej
