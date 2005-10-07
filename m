Received: from mf2.realtek.com.tw ([220.128.56.22]:24079 "EHLO
	mf2.realtek.com.tw") by ftp.linux-mips.org with ESMTP
	id S8133569AbVJGGcD (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Fri, 7 Oct 2005 07:32:03 +0100
Received: from msx.realtek.com.tw (unverified [172.21.1.77]) by mf2.realtek.com.tw
 (Clearswift SMTPRS 5.1.4) with ESMTP id <T73d7e97391dc803816180c@mf2.realtek.com.tw> for <linux-mips@linux-mips.org>;
 Fri, 7 Oct 2005 14:33:59 +0800
Message-ID: <002701c5cb08$c9682630$106215ac@realtek.com.tw>
From: "colin" <colin@realtek.com.tw>
Subject: gcc of SDE6 cannot compile C++ applications
Date: Fri, 7 Oct 2005 14:31:44 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="big5"
Return-Path: <colin@realtek.com.tw>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20051007063144._jTlBiwZiYmNuIlgmTmT5BQlwx-u4D8pQdle3IUH22A@z>


Hi there,
I upgrade my SDE from 5 to 6.
Before upgrading, we can compile C++ applications. After doing that, C++
cannot be compiled by the gcc of SDE6.
The warning message is like this:
    mipsel-linux-gcc: main.cpp: C++ compiler not installed on this system

I found that MIPS offers C++ compiler running on MIPS.
Does MIPS want us to compile C++ on MIPS, not on X86?

Regards,
Colin
