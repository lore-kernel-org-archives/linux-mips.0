Received: from msx.realtek.com.tw (unverified [172.20.1.77]) by mf2.realtek.com.tw
 (Content Technologies SMTPRS 4.3.14) with ESMTP id <T6d0bc3539adc803816a20@mf2.realtek.com.tw> for <linux-mips@linux-mips.org>;
 Wed, 3 Nov 2004 16:53:05 +0800
Message-ID: <01e101c4c182$5d0f2780$8b1a13ac@realtek.com.tw>
From: "colin" <colin@realtek.com.tw>
Subject: KGDB: I cannot stop execution by using "ctrl+c"
Date: Wed, 3 Nov 2004 16:51:52 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="big5"
Return-Path: <colin@realtek.com.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20041103085152.arinsrXpKK0aj91OxtqpCzeJrS63-0bC7ZyPfbfwCaY@z>


Hi all,
When using gdb to debug Linux kernel, I found that it cannot be stopped
temporarily by using "ctrl+c".
After the first strike of "ctrl+c", nothing happen.
After the second, Linux kernel will show these messages:
    Interrupted while waiting for the program.
    Give up (and stop debugging it)? (y or n)
If choose yes, kernel will totally stop and it goes back to gdb shell.
How can I stop kernel temporarily and then resume it?

Thanks and regards,
Colin
