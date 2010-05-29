Received: from mail-gy0-f177.google.com ([209.85.160.177]:36590 "EHLO
        mail-gy0-f177.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491031Ab0E2DN0 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 29 May 2010 05:13:26 +0200
MIME-Version: 1.0
In-Reply-To: <4BFEFBEE.7050108@gmail.com>
References: <1274965420-5091-1-git-send-email-dengcheng.zhu@gmail.com>
        <1274965420-5091-10-git-send-email-dengcheng.zhu@gmail.com>
        <4BFEFBEE.7050108@gmail.com>
Date: Sat, 29 May 2010 11:13:19 +0800
Message-ID: <AANLkTikfXMJr9yBg31ssM1dn_5tjV_vGoRLoDHGXtfoH@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] MIPS/Perf-events: replace pmu names with numeric
        IDs
From: Deng-Cheng Zhu <dengcheng.zhu@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <dengcheng.zhu@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <david.s.daney@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, a.p.zijlstra@chello.nl, paulus@samba.org, mingo@elte.hu, acme@redhat.com, jamie.iles@picochip.com, will.deacon@arm.com
Message-ID: <20100529031319.eTf4CAbYPUHTRVIhq_rHo9lunHSHGBijHwHZdWQ1QqE@z>

2010/5/28 David Daney <david.s.daney@gmail.com>:
> I don't like this one.
>
> In cpu-probe.c we used to have this same type of parallel name array, and it
> was messy.
>
> You know what type of cpu you are running on, so I don't understand the
> advantage of querying by name.  What possible use could there be to knowing
> the names of processors that are not applicable to the current runtime?
[DC]:
1) It's not "querying by name", but "querying name by enum numbers".
2) Oprofile (now a client of Perf-events) needs to print out the PMU names
to the user. If we don't want this patch, we have 2 methods to do this:
- Export the whole mipspmu, and use mipspmu->name;
- Like the old Oprofile (mipsxx), do a 2nd "switch(current_cpu_type())",
the 1st is in perf_event_mipsxx.c init_hw_perf_events().
3) Exporting a single name array indexed by enum IDs should be convenient
for maintaince. Maybe I'm missing some considerations... But how do we
allow Oprofile to get the string name to the user? Not even need to do it?


Deng-Cheng
