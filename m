Received: from mxout1.idt.com ([157.165.5.25]:45751 "EHLO mxout1.idt.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1491199Ab0IOUEP convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 15 Sep 2010 22:04:15 +0200
Received: from mail.idt.com (localhost [127.0.0.1])
        by mxout1.idt.com (8.13.1/8.13.1) with ESMTP id o8FK4531002083
        for <linux-mips@linux-mips.org>; Wed, 15 Sep 2010 13:04:05 -0700
Received: from corpml1.corp.idt.com (corpml1.corp.idt.com [157.165.140.20])
        by mail.idt.com (8.13.8/8.13.8) with ESMTP id o8FK44KA017633
        for <linux-mips@linux-mips.org>; Wed, 15 Sep 2010 13:04:04 -0700 (PDT)
Received: from CORPEXCH1.na.ads.idt.com (localhost [127.0.0.1])
        by corpml1.corp.idt.com (8.11.7p1+Sun/8.11.7) with ESMTP id o8FK44V11060
        for <linux-mips@linux-mips.org>; Wed, 15 Sep 2010 13:04:04 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Porting Linux MIPS issue: maltaint.h files
Date: Wed, 15 Sep 2010 13:04:02 -0700
Message-ID: <AEA634773855ED4CAD999FBB1A66D076010CFA4E@CORPEXCH1.na.ads.idt.com>
From: "Ardelean, Andrei" <Andrei.Ardelean@idt.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org
Message-ID: <20100915200402.wy6_RDvgow2Khk2Z6f4GxhoZ95jKmh26fL4gWVGCGdw@z>

Hi,

I am porting LINUX MIPS from MALTA on a new board. The problem is that
.../mips-boards/maltaint.h files is included in a non-MALTA specific
file, irq-gic.c, without #ifdef CONFIG_MALTA protection. The only need
there is for the following constant:
#define X			0xdead

What is the recommended way to follow since I will replace maltaint.h
with my new file gdint.h?

Thanks,
Andrei
