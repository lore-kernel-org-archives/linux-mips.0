Received: from mail-gw0-f49.google.com ([74.125.83.49]:57740 "EHLO
        mail-gw0-f49.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491031Ab0E2DLC (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 29 May 2010 05:11:02 +0200
MIME-Version: 1.0
In-Reply-To: <4BFEF6CE.3040002@gmail.com>
References: <1274965420-5091-1-git-send-email-dengcheng.zhu@gmail.com>
        <1274965420-5091-8-git-send-email-dengcheng.zhu@gmail.com>
        <4BFEF6CE.3040002@gmail.com>
Date: Sat, 29 May 2010 11:10:56 +0800
Message-ID: <AANLkTikePMXqTj0HkynYS2ZwA2JvL3tYL0yDKHGYDz06@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] MIPS/Perf-events: add raw event support for
        mipsxx 24K/34K/74K/1004K
From: Deng-Cheng Zhu <dengcheng.zhu@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <dengcheng.zhu@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <david.s.daney@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, a.p.zijlstra@chello.nl, paulus@samba.org, mingo@elte.hu, acme@redhat.com, jamie.iles@picochip.com, will.deacon@arm.com
Message-ID: <20100529031056.4YvFilufXmT1oqIm__KG09gKcRuX5hFNQob-iNEFiSg@z>

2010/5/28 David Daney <david.s.daney@gmail.com>:
> Should this just be folded into the other patches?
[DC]: OK.


> I would also reiterate that perhaps the generic support functions be
> separated from the processor specific event definitions.
[DC]: Which generic support functions in perf_event_mipsxx.c? Please refer
to my reply for [6/12].


Deng-Cheng
