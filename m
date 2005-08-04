Received: from msx.realtek.com.tw (unverified [172.21.1.77]) by mf2.realtek.com.tw
 (Clearswift SMTPRS 5.1.4) with ESMTP id <T728ee9041fdc80381613d4@mf2.realtek.com.tw> for <linux-mips@linux-mips.org>;
 Thu, 4 Aug 2005 17:18:27 +0800
Message-ID: <009b01c598d5$2ede3e20$106215ac@realtek.com.tw>
From: "colin" <colin@realtek.com.tw>
Subject: Compiling uClibc with MIPS SDE6
Date: Thu, 4 Aug 2005 17:16:23 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="big5"
Return-Path: <colin@realtek.com.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050804091623.D858sJn2TME2t4vgaDHqUpjJj9xkCZIC81JF2Len6KQ@z>


Hi there,
I encounter a problem when compiling uClibc with SDE6. If compiling with
debug information enabled, the output executable file of busybox is about
the same with the one that is compiled with SDE5, but uClibc libraries are
over 10 times the size of the ones that are compiled with SDE5. I am
wondering if it is because GCC 3.4.4 of SDE6 has changed some parameters
setting?

Regards,
Colin
