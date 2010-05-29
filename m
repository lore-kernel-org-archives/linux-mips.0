Received: from mail-yw0-f201.google.com ([209.85.211.201]:37770 "EHLO
        mail-yw0-f201.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491031Ab0E2DP4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 29 May 2010 05:15:56 +0200
MIME-Version: 1.0
In-Reply-To: <4BFEFF3B.3080009@gmail.com>
References: <1274965420-5091-1-git-send-email-dengcheng.zhu@gmail.com>
        <1274965420-5091-12-git-send-email-dengcheng.zhu@gmail.com>
        <4BFEFF3B.3080009@gmail.com>
Date: Sat, 29 May 2010 11:15:48 +0800
Message-ID: <AANLkTimDlXVsamu79obj_j2tN7NCpluY4D6dBUL5vkGU@mail.gmail.com>
Subject: Re: [PATCH v5 11/12] MIPS/Oprofile: use Perf-events framework as
        backend
From: Deng-Cheng Zhu <dengcheng.zhu@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <dengcheng.zhu@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <david.s.daney@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, a.p.zijlstra@chello.nl, paulus@samba.org, mingo@elte.hu, acme@redhat.com, jamie.iles@picochip.com, will.deacon@arm.com
Message-ID: <20100529031548.a4y0iyzBBhVsiYwatr2ByHC4WM_6UWsvImQ5oVrbm3A@z>

2010/5/28 David Daney <david.s.daney@gmail.com>:
> The mips perf events system should already know what type of cpu it is
> running on.
>
> Can we have all this processor specific perf/counter stuff live in one place
> and simplify all of this?
[DC]: Do you mean to move init_hw_perf_events() out into perf_event.c, and
to deal with mipsxx/loongson2/rm9000/more together? If yes, that's OK.


> Too many magic numbers.  Lets have symbolic names.
[DC]: OK.


Deng-Cheng
