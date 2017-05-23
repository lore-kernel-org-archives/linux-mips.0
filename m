Received: from mail-pf0-x241.google.com ([IPv6:2607:f8b0:400e:c00::241]:34072
        "EHLO mail-pf0-x241.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S23994941AbdEWWGpdZ8Hc (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 24 May 2017 00:06:45 +0200
Received: by mail-pf0-x241.google.com with SMTP id w69so30199027pfk.1
        for <linux-mips@linux-mips.org>; Tue, 23 May 2017 15:06:45 -0700 (PDT)
From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Unify the various copies of libgcc into lib
Date: Tue, 23 May 2017 15:05:39 -0700
Message-ID: <20170523220546.16758-1-palmer@dabbelt.com>
Return-Path: <palmer@dabbelt.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: monstr@monstr.eu, ralf@linux-mips.org, liqin.linux@gmail.com, lennox.wu@gmail.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, linux-mips@linux-mips.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, geert@linux-m68k.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Message-ID: <20170523220539.Ss0VgZytW5QNQyhfqWeQDPD6f3r7SOF0FMN4iHh5_3U@z>

I'm in the process of submitting the RISC-V Linux port, and someone noticed
that we were adding copies of some libgcc emulation routines that were the same
as some of the other ports.  This prompted me to go through and check all the
ports for libgcc.h and to merge the versions that were functionally identical.

The only difference in libgcc.h was that there was a #define for little vs big
endian.  The differences in the emulation routines were all just whitespace.

This patch set comes in two parts:

 * Patch 1 adds new copies of all the C files copied from libgcc, as well as
   moving libgcc.h to include/lib (that's a new folder, which probably means
   it's the wrong place to put it, but I couldn't find anything better).  There
   are Kconfig entries for each of these library functions so architectures can
   select them one at a time.

 * The rest of the patches convert each architecture over to the new system.

Unless I screwed something up, this patch set shouldn't actually change any
functionality.  Unfortunately I don't actually have all these cross compilers
setup so I can't actually test any of this, but I did convert the RISC-V port
over to using this system and it appears to be OK there so at least this isn't
completely broken.
