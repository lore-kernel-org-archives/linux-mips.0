Received: from fairytale.tal.org (cruel.tal.org [195.16.220.85])
	by gw02.mail.saunalahti.fi (Postfix) with ESMTP id 5CE29177E8
	for <linux-mips@linux-mips.org>; Mon, 16 Aug 2004 20:43:26 +0300 (EEST)
Received: from amos (unknown [195.16.220.84])
	by fairytale.tal.org (Postfix) with SMTP id 6AF428DB0
	for <linux-mips@linux-mips.org>; Mon, 16 Aug 2004 20:51:57 +0300 (EEST)
Message-ID: <001501c483b9$36dc6b60$54dc10c3@amos>
From: "Kaj-Michael Lang" <milang@tal.org>
Subject: O2 framebuffer and mmap..
Date: Mon, 16 Aug 2004 20:48:16 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-Path: <milang@tal.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040816174816.CCyaAoQdebtcKbNroRSoTYxlDF6ISmNTObnYvPx1MrQ@z>

Hi

The O2 fb driver (or something else) has broken mmap interface, you probably
know that. Anyway, I've tried to find the cause for it but I've haven't been
that succesfull.

I've patched a current cvs kernel with the old O2-fb
driver (from: http://www.linux-mips.org/~glaurung/)(before gbefb
merge/rename)
and mmap does not work with the old driver, so something else seem to
have changed so that the mmap things don't work. The 2.6.1 kernel on the
above page
does have a functional mmap (my test app and X works with it) but it's very
old..

Does anyone have any hints or ideas ?

Oh, and I've added some sysfs stuff to the gbefb driver, should I post the
changes here ?

-- 
Kaj-Michael Lang , milang@tal.org
