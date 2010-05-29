Received: from mail-yx0-f177.google.com ([209.85.213.177]:58151 "EHLO
        mail-yx0-f177.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491031Ab0E2DIs (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Sat, 29 May 2010 05:08:48 +0200
MIME-Version: 1.0
In-Reply-To: <4BFEF327.2020701@gmail.com>
References: <1274965420-5091-1-git-send-email-dengcheng.zhu@gmail.com>
        <1274965420-5091-5-git-send-email-dengcheng.zhu@gmail.com>
        <4BFEF327.2020701@gmail.com>
Date: Sat, 29 May 2010 11:08:41 +0800
Message-ID: <AANLkTik8wDrdH3vTbvRDsoCUBk9fEI3KmNHRPRBnneXq@mail.gmail.com>
Subject: Re: [PATCH v5 04/12] MIPS: add support for hardware performance
        events (skeleton)
From: Deng-Cheng Zhu <dengcheng.zhu@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Return-Path: <dengcheng.zhu@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: David Daney <david.s.daney@gmail.com>
Cc: linux-mips@linux-mips.org, ralf@linux-mips.org, a.p.zijlstra@chello.nl, paulus@samba.org, mingo@elte.hu, acme@redhat.com, jamie.iles@picochip.com, will.deacon@arm.com
Message-ID: <20100529030841.HZ_u1YrEKY3P9m3W_CbSS3sV5OcMvm5cPagRfKkexL0@z>

2010/5/28 David Daney <david.s.daney@gmail.com>:
> This depends on not consistent with the #if conditions in [01/12] for pmu.h.
>  They should be I think.
[DC]: It's a subset. If the code passes the test on other CPUs (such as
CPU_SB1), we can add them here.


> Probably removing the tests from pmu.h and encoding them here is better.
[DC]: According to my comments for [1/12], how about keeping them untouched
for now?


> IANAL, but who holds the copyright?  You or MTI ?
[DC]: OK. Will change like this:
Copyright (C) 2010 MIPS Technologies, Inc.
Author: Deng-Cheng Zhu


> This shadows the declaration in asm/time.h.  Declare it in exactly one place
> please.
[DC]: OK.


> Same thing about the copyright.
[DC]: OK.


> Not quite true.  They use the high bit, that can be either 31 or 63
> depending on the width of the counters.
[DC]: OK. Will change to consider 64-bit counters.


> Counters can be 64-bits wide, unsigned int is only 32-bits wide.
[DC]: OK.


Deng-Cheng
