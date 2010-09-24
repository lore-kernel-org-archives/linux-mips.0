Received: from mxout1.idt.com ([157.165.5.25]:46718 "EHLO mxout1.idt.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1491122Ab0IXVp2 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 24 Sep 2010 23:45:28 +0200
Received: from mail.idt.com (localhost [127.0.0.1])
        by mxout1.idt.com (8.13.1/8.13.1) with ESMTP id o8OLjKhX013172
        for <linux-mips@linux-mips.org>; Fri, 24 Sep 2010 14:45:21 -0700
Received: from corpml3.corp.idt.com (corpml3.corp.idt.com [157.165.140.25])
        by mail.idt.com (8.13.8/8.13.8) with ESMTP id o8OLjEmb012192
        for <linux-mips@linux-mips.org>; Fri, 24 Sep 2010 14:45:15 -0700 (PDT)
Received: from CORPEXCH1.na.ads.idt.com (localhost [127.0.0.1])
        by corpml3.corp.idt.com (8.11.7p1+Sun/8.11.7) with ESMTP id o8OLjCI28208
        for <linux-mips@linux-mips.org>; Fri, 24 Sep 2010 14:45:13 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Does Linux MIPS use scratch pad ram?
Date: Fri, 24 Sep 2010 14:45:11 -0700
Message-ID: <AEA634773855ED4CAD999FBB1A66D07601159CB4@CORPEXCH1.na.ads.idt.com>
From: "Ardelean, Andrei" <Andrei.Ardelean@idt.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org
Message-ID: <20100924214511.wvLOPmlra2WSJhBj-F92pOjtqj4Uu5bKG3DMfJipNUs@z>

Hi,

I am using MALTA platform and try to port Linux on a new platform.
It seems to me that in spram.c the sprams are probed  if they are
available or not but I cannot see Linux really using those afterwards.
My platform has no spram so I am trying to avoid this probing. The
problem is that spram.c is not MALTA specific but as the comment says in
spram.c there are some MALTA specific addresses. Unfortunately I have
some Flash at those addresses.
How to fix this issue?

Thanks,
Andrei
  
