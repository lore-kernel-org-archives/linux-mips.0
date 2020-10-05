Return-Path: <SRS0=NFTv=DM=vger.kernel.org=linux-mips-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FD1C4363C
	for <linux-mips@archiver.kernel.org>; Mon,  5 Oct 2020 00:40:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A71FC206C1
	for <linux-mips@archiver.kernel.org>; Mon,  5 Oct 2020 00:40:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgJEAkz (ORCPT <rfc822;linux-mips@archiver.kernel.org>);
        Sun, 4 Oct 2020 20:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgJEAkz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 4 Oct 2020 20:40:55 -0400
Received: from orcam.me.uk (unknown [IPv6:2001:4190:8020::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9DBA2C0613CE
        for <linux-mips@vger.kernel.org>; Sun,  4 Oct 2020 17:40:54 -0700 (PDT)
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id F2C872BE086;
        Mon,  5 Oct 2020 01:40:51 +0100 (BST)
Date:   Mon, 5 Oct 2020 01:40:47 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Baoquan He <bhe@redhat.com>
cc:     Huacai Chen <chenhc@lemote.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Eric Biederman <ebiederm@xmission.com>,
        Dave Young <dyoung@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        kexec@lists.infradead.org, Fuxin Zhang <zhangfx@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 1/3] MIPS: Crash kernel should be able to see old
 memories
In-Reply-To: <alpine.LFD.2.21.2010032200470.333514@eddie.linux-mips.org>
Message-ID: <alpine.LFD.2.21.2010050133330.333514@eddie.linux-mips.org>
References: <1600828257-31316-1-git-send-email-chenhc@lemote.com> <20200923024548.GL25604@MiWiFi-R3L-srv> <CAAhV-H66O77hK7kB8cCcM6XUOc-TFEg_TJG+GrCSEdD89Qxb7g@mail.gmail.com> <20200923030847.GM25604@MiWiFi-R3L-srv>
 <alpine.LFD.2.21.2010032200470.333514@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 3 Oct 2020, Maciej W. Rozycki wrote:

> > Interesting. Seems MIPS does support mem=X@Y, even though the document
> > of 'mem=' says it's used to specify amount of memory, but not memory
> > region. Anyway, leave this to mips reviewers, thanks for replying.
> > 
> > ~~~~~~~~~~~~~~~~~~~
> >         mem=nn[KMG]     [KNL,BOOT] Force usage of a specific amount of memory
> >                         Amount of memory to be used in cases as follows:
> 
>  Yep, I implemented it for the DECstation back in 2000:
> 
> commit 97b7ae4257ef7ba8ed9b7944a4f56a49af3e8abb
> Author: Ralf Baechle <ralf@linux-mips.org>
> Date:   Mon Dec 11 16:41:05 2000 +0000
> 
>     Memmap fixes from Maciej.
> 
> (from the LMO repo) in line with the x86 syntax.  I don't know why it 
> hasn't ever been documented in "Kernel Parameters" (for any port), but I'm 
> fairly sure it has been somewhere.

 Self-correction: documentation used to be there, but was removed around 
Linux 2.5.65:

commit 041a679cb20e4fcb841665b09cf7c6d24ab4ad39
Author: Ralf Baechle <ralf@linux-mips.org>
Date:   Thu Jun 5 00:04:28 2003 +0000

    Merge with Linux 2.5.65.

(same repo) as the parameter was renamed to `memmap=' in the x86 port.  
Obviously whoever did that did not bother to check other ports, even 
though the parameter was marked (and `memmap=' still is) generic.

  Maciej
