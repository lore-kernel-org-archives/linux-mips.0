Received: from bby1mta02.pmc-sierra.com ([216.241.235.117]:54059 "EHLO
        bby1mta02.pmc-sierra.bc.ca" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492308Ab0BCLiC convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 3 Feb 2010 12:38:02 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Cached Base address difference.
Date: Wed, 3 Feb 2010 03:34:25 -0800
Message-ID: <A7DEA48C84FD0B48AAAE33F328C0201404809DE0@BBY1EXM11.pmc_nt.nt.pmc-sierra.bc.ca>
In-Reply-To: <20100203012934.GA20375@linux-mips.org>
References: <1265015455-32553-1-git-send-email-wuzhangjin@gmail.com> <b2b2f2321002011903m7a090481m52d84a664beb5468@mail.gmail.com> <20100203012934.GA20375@linux-mips.org>
From: "Anoop P.A." <Anoop_P.A@pmc-sierra.com>
Return-Path: <Anoop_P.A@pmc-sierra.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org
Message-ID: <20100203113425.14OAyEMJtH0cuKTu6zd9PkmeZ4Lw7ktNBnVZVs0twnc@z>


Hi list,

I am seeing a address conflict in asm-generic/spaces.h  . in spaces.h (
64 bit)CAC_BASE has been defined as 0x9800000000000000 however see mips
run says it is 0x9000000000000000
http://books.google.co.in/books?id=kk8G2gK4Tw8C&lpg=PP1&dq=see%20mips%20
run&pg=PA51#v=onepage&q=&f=false

Is this intentional?

Thanks
Anoop
