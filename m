Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]:9696 "EHLO
        TX2EHSOBE005.bigfish.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491076Ab1FJMgM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 10 Jun 2011 14:36:12 +0200
Date: Fri, 10 Jun 2011 14:35:57 +0200
From: Robert Richter <robert.richter@amd.com>
Subject: Re: [PATCH 0/2] MIPS: oprofile: callgraph support
Message-ID: <20110610123557.GQ20052@erda.amd.com>
References: <1305290285-13818-1-git-send-email-gergely@homejinni.com>
 <20110524084250.GR20052@erda.amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20110524084250.GR20052@erda.amd.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: Gergely Kis <gergely@homejinni.com>, Ralf Baechle <ralf@linux-mips.org>
Cc: "linux-mips@linux-mips.org" <linux-mips@linux-mips.org>, Daniel Kalmar <kalmard@homejinni.com>, "oprofile-list@lists.sourceforge.net" <oprofile-list@lists.sourceforge.net>
Message-ID: <20110610123557.PxtkbcVaS95bo9VEe4fxEuhGO_aDiCatoFURsHj2GSw@z>

On 24.05.11 10:42:50, Robert Richter wrote:
> On 13.05.11 08:38:03, Gergely Kis wrote:
> > From: Daniel Kalmar <kalmard@homejinni.com>
> > 
> > These patches add callgraph/backtrace support to oprofile on MIPS.
> > 
> > Stack unwinding is done by code examination. For kernelspace, the
> > already existing unwind function is utilized that uses kallsyms to
> > quickly find the beginning of functions. For userspace a new function
> > was added that examines code at and before the pc.
> > 
> > Daniel Kalmar (2):
> >   MIPS: Add unwind_stack_by_address to support unwinding from any
> >     kernel code address
> >   MIPS: oprofile: Add callgraph support
> > 
> >  arch/mips/include/asm/stacktrace.h |    4 +
> >  arch/mips/kernel/process.c         |   18 +++-
> >  arch/mips/oprofile/Makefile        |    2 +-
> >  arch/mips/oprofile/backtrace.c     |  173 ++++++++++++++++++++++++++++++++++++
> >  arch/mips/oprofile/common.c        |    1 +
> >  arch/mips/oprofile/op_impl.h       |    2 +
> >  6 files changed, 194 insertions(+), 6 deletions(-)
> >  create mode 100644 arch/mips/oprofile/backtrace.c

If there are no objections I will apply the patches next week to the
oprofile tree.

Thanks, 

-Robert

-- 
Advanced Micro Devices, Inc.
Operating System Research Center
