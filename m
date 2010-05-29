Received: from mail-gy0-f177.google.com ([209.85.160.177]:34989 "EHLO
        mail-gy0-f177.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491031Ab0E2DMa (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 29 May 2010 05:12:30 +0200
MIME-Version: 1.0
In-Reply-To: <4BFEF7B5.9090804@gmail.com>
References: <1274965420-5091-1-git-send-email-dengcheng.zhu@gmail.com>
        <1274965420-5091-9-git-send-email-dengcheng.zhu@gmail.com>
        <4BFEF7B5.9090804@gmail.com>
Date: Sat, 29 May 2010 11:12:21 +0800
Message-ID: <AANLkTilQStnxUNEhbGNa3FZCA4z-YQ93paCP_LeHkSLW@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] MIPS: move mipsxx pmu helper functions to
        Perf-events
From: Deng-Cheng Zhu <dengcheng.zhu@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <dengcheng.zhu@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <david.s.daney@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, a.p.zijlstra@chello.nl, paulus@samba.org, mingo@elte.hu, acme@redhat.com, jamie.iles@picochip.com, will.deacon@arm.com
Message-ID: <20100529031221.DLgDvHWxAJwZZP8FVIQ1CfSBVA1LysAAlh5xJVNS9pI@z>

2010/5/28 David Daney <david.s.daney@gmail.com>:
> Is is possible to fold this patch also?  I don't think we need to follow the
> exact evolution of the new files.
[DC]: Patches 1~7 are the primary implementation for MIPS Perf-events. And
patches 8~12 make Oprofile use Perf-events as backend. By doing this, 1~7
can be reviewed/applied/built/tested independently. Maybe you are referring
to Patchwork, so the [00/12] is not visible, here is the link:
http://www.linux-mips.org/archives/linux-mips/2010-05/msg00326.html


Deng-Cheng
