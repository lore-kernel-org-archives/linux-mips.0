Received: from rv-out-0910.google.com ([209.85.198.189]:54689 "EHLO
	rv-out-0910.google.com") by ftp.linux-mips.org with ESMTP
	id S20027159AbYAINUt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 9 Jan 2008 13:20:49 +0000
Received: by rv-out-0910.google.com with SMTP id l15so207089rvb.24
        for <linux-mips@linux-mips.org>; Wed, 09 Jan 2008 05:20:40 -0800 (PST)
From: "lovecentry" <lovecentry@gmail.com>
Subject: =?gb2312?B?tPC4tDoga3NlZzEgdW5jYWNoZSBhY2Nlc3MgaXNzdWU=?=
Date: Wed, 9 Jan 2008 21:20:11 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20080108185903.GC30643@linux-mips.org>
Message-ID: <4784ca28.06538c0a.5e01.10f5@mx.google.com>
Return-Path: <lovecentry@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: 'Ralf Baechle' <ralf@linux-mips.org>, 'Thomas Bogendoerfer' <tsbogend@alpha.franken.de>
Cc: linux-mips@linux-mips.org
Message-ID: <20080109132011.VNniBqf_aWqh1EpLcH2V-OEMK6PQh4tyh97NSJCi6YM@z>

Hi gents
	Thanks for your reply. Now I try to implement MIPS R10000
microprcoessor simulation with C language, so many issues still puzzle me
although I have read MIPS R10000 Microprocessor paper introduced by Yeager
1996 more than ten times since last year. 
	As Thomas said, R10K will access directly to dram for those uncached
load/store operations. Which path in the MIPS R10k makes it available? Is
system interface does that stuff? I found it has uncached buffer.
Another issue arises, as system brings up the PC will be assigned to
0xbfc00000 and it need to fetch instructions from dram directly rather than
dram then put first four instructions into decode/remap unit, but from the
MIPS R10000 diagram decode/remap unit only get instructions from ICACHE. How
MIPS R10000 handle this case?

Tony

-----邮件原件-----
发件人: Ralf Baechle [mailto:ralf@linux-mips.org] 
发送时间: 2008年1月9日 2:59
收件人: Thomas Bogendoerfer
抄送: lovecentry; linux-mips@linux-mips.org
主题: Re: kseg1 uncache access issue

On Tue, Jan 08, 2008 at 06:02:06PM +0100, Thomas Bogendoerfer wrote:

> On Wed, Jan 09, 2008 at 12:35:06AM +0800, lovecentry wrote:
> > As we know in mips achitecture if current pc falls into kseg1 segment,
any
> > memory reference will bypass cache and fetch directly from dram. But for
> > some prcoessor such like mips R10K it has off chip L2 cache. I haven't
found
> 
> why do you think so ? R10k L2 cache controller is inside CPU and any
> access with uncached attribute will go directly to memory. The only
> systems, where this might be different are systems with caches unknown
> to the cpu. But even those usually obey that uncached accesses are
> going directly to memory.

It should also be mentioned that some R10000 machines do odd stuff with
uncached addresses.

IP27 class machines reuse the entire physical address space several times
to map different things.  The selection of the four uncached address
spaces id done by the uncached attribute which is specified either in
the TLB or or as as bit 59..60 of a virtual address in XKPHYS.

The memory controller of the Indigo 2 R10000 needs to be switched to a
special slower mode to allow uncached accesses first.

  Ralf
