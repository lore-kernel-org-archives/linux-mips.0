Received: from mail-yw0-f201.google.com ([209.85.211.201]:61428 "EHLO
        mail-yw0-f201.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491031Ab0E2DOl (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 29 May 2010 05:14:41 +0200
MIME-Version: 1.0
In-Reply-To: <4BFEFD4D.4010801@gmail.com>
References: <1274965420-5091-1-git-send-email-dengcheng.zhu@gmail.com>
        <1274965420-5091-11-git-send-email-dengcheng.zhu@gmail.com>
        <4BFEFD4D.4010801@gmail.com>
Date: Sat, 29 May 2010 11:14:33 +0800
Message-ID: <AANLkTinxpwh5qTr7DXPufDAcCtF7ZIFD07U3A-F3TS8w@mail.gmail.com>
Subject: Re: [PATCH v5 10/12] MIPS/Perf-events: allow modules to get pmu
        number of counters
From: Deng-Cheng Zhu <dengcheng.zhu@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <dengcheng.zhu@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <david.s.daney@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, a.p.zijlstra@chello.nl, paulus@samba.org, mingo@elte.hu, acme@redhat.com, jamie.iles@picochip.com, will.deacon@arm.com
Message-ID: <20100529031433.sUwTFUxj7NTBwx7imb4hP91sjtZeTXMH16VUiVEzPQY@z>

2010/5/28 David Daney <david.s.daney@gmail.com>:
> Why is it called 'max_events' when it is returning the number of counters?
>  How about mipspmu_get_max_counters?
[DC]: OK.


> Do we even need this accessor?
>
> Why not just query it from the struct mips_pmu?  Don't you need the mipspmu
> structure anyhow to be able to use the counters?
[DC]: This is for the code outside of Perf-events, such as the module of
the new Oprofile which is a client of Perf-events. If we don't need this,
we have to export the whole mipspmu.


Deng-Cheng
