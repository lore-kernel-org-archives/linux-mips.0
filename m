Received: from mxout1.idt.com ([157.165.5.25]:41490 "EHLO mxout1.idt.com"
        rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org with ESMTP
        id S1493114Ab1DRSOn convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 18 Apr 2011 20:14:43 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: How can I access h/w registers in user space?
Date: Mon, 18 Apr 2011 11:14:32 -0700
Message-ID: <AEA634773855ED4CAD999FBB1A66D07601988EC8@CORPEXCH1.na.ads.idt.com>
In-Reply-To: <BANLkTi=QLZe68o2=1Vk+4QTu-ru1T6H=vQ@mail.gmail.com>
References: <AEA634773855ED4CAD999FBB1A66D07601988DFA@CORPEXCH1.na.ads.idt.com> <BANLkTi=QLZe68o2=1Vk+4QTu-ru1T6H=vQ@mail.gmail.com>
From: "Ardelean, Andrei" <Andrei.Ardelean@idt.com>
Return-Path: <Andrei.Ardelean@idt.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: Manuel Lauss <manuel.lauss@googlemail.com>, linux-mips@linux-mips.org
Message-ID: <20110418181432.ADeZKhAJVBc4FrmMFf7rdOYqwdWjUOUdiYb7sShTTYw@z>

Hi,

Mmap() worked fine for one io memory region, but when I tried to open
twice for different io memory regions with different base addresses and
sizes it didn't work. It returned the same memory pointer value in both
cases. In my design the h/w guys put those h/w registers in two distinct
memory mapped regions with a large reserved area in between. Is it any
solution for this case?

Thanks,
Andrei
