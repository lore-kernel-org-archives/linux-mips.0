Received: from newman.mips.com (ns-dmz [206.31.31.225])
	by mx2.mips.com (8.12.5/8.12.5) with ESMTP id gAIDKSNf003314
	for <linux-mips@linux-mips.org>; Mon, 18 Nov 2002 05:20:28 -0800 (PST)
Received: from grendel (grendel [192.168.236.16])
	by newman.mips.com (8.9.3/8.9.0) with SMTP id FAA19818
	for <linux-mips@linux-mips.org>; Mon, 18 Nov 2002 05:20:29 -0800 (PST)
Message-ID: <015201c28f05$cb583800$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Alignment of FP Context Storage
Date: Mon, 18 Nov 2002 14:24:06 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20021118132406.eFhzVN2tH1VeumJ9QaxE4QlS-7EtDw4Y8q4v8P-ni4U@z>

I'm cleaning up some old Linux kernel sandboxes, and
came across a patch which I had long ago made in a
local copy of include/asm-mips/processor.h but which
does not seem to have been propagated more widely.
I had added "__attribute__((aligned(8))))" to the
declarations of the mips_fpu_hard_struct and
mips_fpu_soft_struct data structures, presumably
because there was a need to ensure 64-bit alignment
of the elements so that LDC1 instructions would work.
We don't generally have a problem here, presumably
because either the previous data declarations naturally
align things to 64-bits, or because we've ensured things 
at a higher level of makfile compiler directives.  Are we 
in fact guarnateed to be safe without the source code 
directive, or should those __attribute__ directives be 
added as insurance?

            Kevin K.
