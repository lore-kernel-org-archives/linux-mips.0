Received: from mx.mips.com ([63.167.95.198]:50655 "EHLO dns0.mips.com")
	by ftp.linux-mips.org with ESMTP id S20037827AbXBWLjf (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 23 Feb 2007 11:39:35 +0000
Message-ID: <005701c7573f$6aca0890$10eca8c0@grendel>
From: "Kevin D. Kissell" <kevink@mips.com>
References: <80178.32924.qm@web7903.mail.in.yahoo.com><01fc01c75693$195858b0$10eca8c0@grendel><20070223030645.GA1349@linux-mips.org> <20070223.123630.92584856.nemoto@toshiba-tops.co.jp>
Subject: Re: unaligned access
Date: Fri, 23 Feb 2007 09:18:59 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <kevink@mips.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: ralf@linux-mips.org, Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: sathesh_edara2003@yahoo.co.in, rajat.noida.india@gmail.com, linux-mips@linux-mips.org
Message-ID: <20070223081859.r41k2KkUO7oikwYSfxw9xvxkRwVDD1gDRLd3szy2xJM@z>

> So how about this interface?
> 
> 1. echo show > /sys/kernel/unaligned_action
> 
> Show register dump and processor name at each unaligned exception,
> using show_regs() or someting.
> 
> 2. echo quiet > /sys/kernel/unaligned_action
> 
> Siliently fixup unaligned exceptions.
> 
> 3. cat /sys/kernel/unaligned_instructions
> 
> Print unaligned_instructions variable.
> 
> 
> Creating files in /sys/kernel is fairly simple:
> 
> subsys_create_file(&kernel_subsys, &foo_attr);
> 
> Any comments?

One thing about the current, system-call based interface that is kind-of
cool, and different from both what you propose and what was described
as being implemented for ARM, is that Ralf's scheme is per-thread.
I don't know if that power really outweighs the ease-of-use aspect
of being able to manipuate it from the shell command line, but it's 
not something to throw away lightly.  I have no issues with moving
the log data, should it be resurrected, from syslog to /sys/kernel/whatever,
though.

            Regards,

            Kevin K.
