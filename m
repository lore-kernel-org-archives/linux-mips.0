Received: from mf2.realtek.com.tw ([60.248.182.46]:28176 "EHLO
	mf2.realtek.com.tw") by ftp.linux-mips.org with ESMTP
	id S8133762AbWC2Nhg (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Wed, 29 Mar 2006 14:37:36 +0100
Received: from msx.realtek.com.tw (unverified [172.21.1.77]) by mf2.realtek.com.tw
 (Clearswift SMTPRS 5.1.7) with ESMTP id <T7754657d1bdc803816a88@mf2.realtek.com.tw> for <linux-mips@linux-mips.org>;
 Wed, 29 Mar 2006 21:50:45 +0800
Message-ID: <024c01c65337$63931c90$106215ac@realtek.com.tw>
From: "colin" <colin@realtek.com.tw>
Subject: Using hardware watchpoint for applications debugging
Date: Wed, 29 Mar 2006 21:47:58 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="big5"
Return-Path: <colin@realtek.com.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20060329134758.qlb6qALxA8VXkLFTRUKv8yKmHjP_NvgynKRwAiB1vBk@z>


Hi all,
Our applications encounter memory crash very often. Thus we would like to
use hardware watchpoint on our platform, MIPS 4KEc.
After starting to design it, more and more issues emerge. They are listed
below:
    1. WatchLo Register only has 29 bits to indicate the VAddr. Therefore,
it will also trigger exceptions when accessing nearby addresses.
    2. When an exception happens and we find that it's not touching the righ
address, we will discard it. However, exception will happen again because
the former instruction will be re-executed when the exception is finished.

Is there any easy way to solve these problems?

Regards,
Colin
