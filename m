Received: from tx2ehsobe001.messaging.microsoft.com ([65.55.88.11]:35112 "EHLO
        TX2EHSOBE001.bigfish.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491161Ab1EXInE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 24 May 2011 10:43:04 +0200
Date: Tue, 24 May 2011 10:42:50 +0200
From: Robert Richter <robert.richter@amd.com>
Subject: Re: [PATCH 0/2] MIPS: oprofile: callgraph support
Message-ID: <20110524084250.GR20052@erda.amd.com>
References: <1305290285-13818-1-git-send-email-gergely@homejinni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1305290285-13818-1-git-send-email-gergely@homejinni.com>
Return-Path: <robert.richter@amd.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Gergely Kis <gergely@homejinni.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Daniel Kalmar <kalmard@homejinni.com>, "oprofile-list@lists.sourceforge.net" <oprofile-list@lists.sourceforge.net>
Message-ID: <20110524084250.c7rKtsGmkQ-hJ1mWXAYfl9LRNAwqRxM5ha-8ii4K8PI@z>

On 13.05.11 08:38:03, Gergely Kis wrote:
> From: Daniel Kalmar <kalmard@homejinni.com>
> 
> These patches add callgraph/backtrace support to oprofile on MIPS.
> 
> Stack unwinding is done by code examination. For kernelspace, the
> already existing unwind function is utilized that uses kallsyms to
> quickly find the beginning of functions. For userspace a new function
> was added that examines code at and before the pc.
> 
> Daniel Kalmar (2):
>   MIPS: Add unwind_stack_by_address to support unwinding from any
>     kernel code address
>   MIPS: oprofile: Add callgraph support
> 
>  arch/mips/include/asm/stacktrace.h |    4 +
>  arch/mips/kernel/process.c         |   18 +++-
>  arch/mips/oprofile/Makefile        |    2 +-
>  arch/mips/oprofile/backtrace.c     |  173 ++++++++++++++++++++++++++++++++++++
>  arch/mips/oprofile/common.c        |    1 +
>  arch/mips/oprofile/op_impl.h       |    2 +
>  6 files changed, 194 insertions(+), 6 deletions(-)
>  create mode 100644 arch/mips/oprofile/backtrace.c

Daniel and Gergely,

the patches look good so far. I fixed the coding style to have the
opening brace of functions at the beginning of the next line. After
the MIPS maintainer's ack I will apply them to the oprofile tree.

Thanks for your contribution.

Ralf,

please ack.

Thanks,

-Robert

-- 
Advanced Micro Devices, Inc.
Operating System Research Center
