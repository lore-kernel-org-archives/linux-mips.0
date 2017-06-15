Received: from mailapp01.imgtec.com ([195.59.15.196]:62282 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23994787AbdFOXEcOhqGr (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 16 Jun 2017 01:04:32 +0200
Date: Fri, 16 Jun 2017 00:04:15 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: [PATCH v2 00/10] Instruction emulation fixes
Message-ID: <alpine.DEB.2.00.1706150032240.23046@tp.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Return-Path: <Maciej.Rozycki@imgtec.com>
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
Cc: James Hogan <james.hogan@imgtec.com>, linux-mips@linux-mips.org
Message-ID: <20170615230415.LBr7Q3FeEZzp1e5tYBuc7jzf7pALwZ3IlM8_1E8fP0I@z>

Ralf,

 Here is a bunch of instruction emulation fixes and clean-ups, mostly 
though not only affecting branches in the FPU emulator.  The severity of 
failures addressed varies, see the individual patch descriptions for 
details.  These patches have been verified to a varying extent, depending 
on the nature of the individual change, by running the GCC and glibc test 
suites for the MIPS16 o32 little-endian multilib.

 Version 2 addresses points raised in the review of the original 
submission: missing proper justification for changes #5 and #8 and an 
entirely new change #10 to lower the log priority of the noise produced.

 Please queue for the next release cycle and backport as noted with each 
of the patches.

  Maciej
