Received: from localhost (localhost.tusur.ru [127.0.0.1])
	by tusur.ru (Postfix) with SMTP id A0860B72F1
	for <linux-mips@linux-mips.org>; Tue, 17 Aug 2004 08:53:50 +0700 (TSD)
Received: from roman (unknown [211.189.34.20])
	by tusur.ru (Postfix) with ESMTP id 5E98BB4BAA
	for <linux-mips@linux-mips.org>; Tue, 17 Aug 2004 08:53:37 +0700 (TSD)
Message-ID: <001601c483fd$9e3ae180$1422bdd3@roman>
From: "Roman Mashak" <mrv@tusur.ru>
Subject: Yamon compiling and linking
Date: Tue, 17 Aug 2004 10:57:50 +0900
MIME-Version: 1.0
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: 7bit
Return-Path: <mrv@tusur.ru>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20040817015750.NYMkSeCTWAuEMRvBF0Btw8KvfeK1EW1DzU_-77TMaZ8@z>

Hello!

I solved the problem with Yamon compiling I asked recently, but still have
technical related questions about Yamon linking & code allocating in memory.

Here it is.

When I compile little-endian only image, as far as I understood, I got image
without RESET code at the beginning, so according to the memory map and link
script (link_el.xn) - starting entry point is __RESET_HANDLER_END (locating
in init.S) and its address is 0x9fc10000.
So, I don't quite understand, how will be going after CPU reset? As
documentation's saying "following a reset, hardware fetches instructions
starting at the reset exception vector 0xBFC00000". But what is waiting at
this address, because reset code (reset.S) is not compiled and is not
linked?

Could you please make it clear to me?

Thanks in advance!

With best regards, Roman Mashak.  E-mail: mrv@tusur.ru
