Received: from mailapp01.imgtec.com ([195.59.15.196]:36395 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S23991978AbdHRM3xArEM9 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 18 Aug 2017 14:29:53 +0200
Date: Fri, 18 Aug 2017 13:29:37 +0100
From: "Maciej W. Rozycki" <macro@imgtec.com>
Subject: Re: [PATCH] MIPS: Set ISA bit in entry-y for microMIPS kernels
In-Reply-To: <20170807231647.19551-1-paul.burton@imgtec.com>
Message-ID: <alpine.DEB.2.00.1708181302480.17596@tp.orcam.me.uk>
References: <20170807231647.19551-1-paul.burton@imgtec.com>
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
To: Paul Burton <paul.burton@imgtec.com>
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>
Message-ID: <20170818122937.ZUyeL7zjeYrTPD8T-k-LXbeF-RVPCJu61TmUE7-_kCI@z>

On Tue, 8 Aug 2017, Paul Burton wrote:

> When building a kernel for the microMIPS ISA, ensure that the ISA bit
> (ie. bit 0) in the entry address is set. Otherwise we may include an
> entry address in images which bootloaders will jump to as MIPS32 code.

 Hmm, what's going on here?  The ISA bit is set by the linker according to 
the mode the code at the entry symbol has been assembled for, e.g.:

$ readelf -h vmlinux | grep Entry
  Entry point address:               0x804355e1
$ readelf -s vmlinux | grep kernel_entry
156535: 80100400     0 FUNC    GLOBAL DEFAULT [MICROMIPS]     1 __kernel_entry
156742: 804355e0   146 FUNC    GLOBAL DEFAULT [MICROMIPS]     1 kernel_entry
$ 

or no microMIPS (or MIPS16) executable could work.  Is your build process 
or toolchain used broken by any chance?

  Maciej
