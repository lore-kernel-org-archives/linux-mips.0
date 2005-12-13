Received: from mf2.realtek.com.tw ([220.128.56.22]:9482 "EHLO
	mf2.realtek.com.tw") by ftp.linux-mips.org with ESMTP
	id S8133519AbVLMJ1o (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 13 Dec 2005 09:27:44 +0000
Received: from msx.realtek.com.tw (unverified [172.21.1.77]) by mf2.realtek.com.tw
 (Clearswift SMTPRS 5.1.7) with ESMTP id <T7531950ea4dc80381613b4@mf2.realtek.com.tw> for <linux-mips@linux-mips.org>;
 Tue, 13 Dec 2005 17:30:25 +0800
Message-ID: <017301c5ffc7$80383830$106215ac@realtek.com.tw>
From: "colin" <colin@realtek.com.tw>
Subject: To put Linux kernel as closer as possible to 0x80000000
Date: Tue, 13 Dec 2005 17:27:56 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="big5"
Return-Path: <colin@realtek.com.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20051213092756.sKA7aMQj4IQLqnjXGQa10fwW3xKiAV250fB1ddsA9MY@z>


Hi all,
We want to put Linux kernel as closer as possible to the bottom of memory.
I know that there is some stuff put in the beginning of memory, like
Exception table.
So, what's the closest address to 0x80000000 that is allowable to store
kernel?

Regards,
Colin
