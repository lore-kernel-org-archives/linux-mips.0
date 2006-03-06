Received: from mf2.realtek.com.tw ([60.248.182.46]:15625 "EHLO
	mf2.realtek.com.tw") by ftp.linux-mips.org with ESMTP
	id S8133371AbWCFMmx (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 6 Mar 2006 12:42:53 +0000
Received: from msx.realtek.com.tw (unverified [172.21.1.77]) by mf2.realtek.com.tw
 (Clearswift SMTPRS 5.1.7) with ESMTP id <T76ddbf0e6edc803816172c@mf2.realtek.com.tw> for <linux-mips@linux-mips.org>;
 Mon, 6 Mar 2006 20:53:46 +0800
Message-ID: <002201c6411c$a06dadb0$106215ac@realtek.com.tw>
From: "colin" <colin@realtek.com.tw>
Subject: To stick the kernel start address to 0x80100000
Date: Mon, 6 Mar 2006 20:51:02 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="big5"
Return-Path: <colin@realtek.com.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20060306125102.G5WttAxi7OQ04KXJ7CzEmNoDUtCVH1j8Yv3jnxZ2fUs@z>


Hi all,
I tried to stick the kernel start address to 0x80100000 and modified
vmlinux.ld.S like this:
  .text : {
    arch/mips/kernel/head.o(.init.text)
    *(.text)
    SCHED_TEXT
    LOCK_TEXT
    *(.fixup)
    *(.gnu.warning)
  } =0

After some tests, it seems to work well. Is this a good way to stick the
kernel start address to 0x80100000?

Regards,
Colin
