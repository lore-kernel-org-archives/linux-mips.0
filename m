Received: from mail-gw0-f49.google.com ([74.125.83.49]:59452 "EHLO
        mail-gw0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491031Ab0E2DKM (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 29 May 2010 05:10:12 +0200
MIME-Version: 1.0
In-Reply-To: <4BFEF5D7.4050502@gmail.com>
References: <1274965420-5091-1-git-send-email-dengcheng.zhu@gmail.com>
        <1274965420-5091-7-git-send-email-dengcheng.zhu@gmail.com>
        <4BFEF5D7.4050502@gmail.com>
Date: Sat, 29 May 2010 11:10:05 +0800
Message-ID: <AANLkTim22Di_l7pM_qGA79MA0xejpi0Lo1OTZqCvP7-L@mail.gmail.com>
Subject: Re: [PATCH v5 06/12] MIPS: add support for hardware performance
        events (mipsxx)
From: Deng-Cheng Zhu <dengcheng.zhu@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <dengcheng.zhu@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <david.s.daney@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, a.p.zijlstra@chello.nl, paulus@samba.org, mingo@elte.hu, acme@redhat.com, jamie.iles@picochip.com, will.deacon@arm.com
Message-ID: <20100529031005.NTQpLPCt-CBs7UmI5fkPdhw5Pm8ARDZfDNsG2hj6m94@z>

2010/5/28 David Daney <david.s.daney@gmail.com>:
> General comments:
>
> Can you separate the code that reads and writes the performance counter
> registers from the definitions of the various counters themselves?
[DC]:
1) Do you mean to move M_PERFCTL_* stuff out into pmu.h (or mipsregs.h)?
If yes, that's OK. Again (my reply for [1/12] mentions this for the 1st
time): After making Oprofile use Perf-events as backend (patches 8~12 do
this), register definitions and read/write functions will locate in pmu.h
(or mipsregs.h) and perf_event_$cpu.c, respectively.
2) According to your reply to [7/12], do you mean the perf counter
read/write functions (such as mipsxx_pmu_read_counter()) are generic
support functions? No, they are specific for mipsxx CPUs.


> Also take into account that the counter registers may be either 32 or 64
> bits wide.  The interfaces you are defining should take that into account
> even if the specific implementations only work with 32-bit registers.
[DC]: OK.


Deng-Cheng
