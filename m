Received: from sunsv2.sasken.com (localhost [127.0.0.1])
	by sandesha.sasken.com (8.12.8/8.12.8) with ESMTP id h3A5fwWY029539
	for <linux-mips@linux-mips.org>; Thu, 10 Apr 2003 11:12:00 +0530 (IST)
Received: from pcz-madhavis.sasken.com (IDENT:madhavis@pcz-madhavis.sasken.com [10.1.64.210])
	by sunsv2.sasken.com (8.11.6/8.11.6) with ESMTP id h3A5g6w16430
	for <linux-mips@linux-mips.org>; Thu, 10 Apr 2003 11:12:06 +0530 (IST)
Date: Thu, 10 Apr 2003 11:12:06 +0530 (IST)
From: Madhavi <madhavis@sasken.com>
Subject: Kernel compilation for MIPS
Message-ID: <Pine.LNX.4.33.0304101106270.2692-100000@pcz-madhavis.sasken.com>
MIME-Version: 1.0
Content-type: multipart/mixed; boundary="=_IS_MIME_Boundary"
Return-Path: <madhavis@sasken.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20030410054206.gAgLjQ6kXa1R7qIqgnB1LV6fQlZUbGXMk6lF02SZ0K0@z>

--=_IS_MIME_Boundary
Content-Type: TEXT/PLAIN; charset=US-ASCII


Hi

During my kernel compilation for MIPS (R5432) using the MIPS
cross-compiler, I am getting the following error.

mipsel-linux-ld:arch/mips/ld.script:6: parse error

The line 6 in ld.script is:
	. = ;

I have seen in the arch/mips/Makefile that sed is replacing @@LOADADDR@@
by $LOADADDR in ld.script.in. Hence the line, . = @@LOADADDR@@; is getting
converted to . = ;.

Do I need to assign the LOADADDR somewhere.

Thank you in advance.

regards
Madhavi.

Madhavi Suram
Software Engineer
Customer Delivery / Networks
Sasken Communication Technologies Limited
139/25, Ring Road, Domlur
Bangalore - 560071 India
Email: madhavis@sasken.com
Tel: + 91 80 5355501 Extn: 8062
Fax: + 91 80 5351133
URL: www.sasken.com


--=_IS_MIME_Boundary
Content-Type: text/plain;charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

************************************************************************

SASKEN BUSINESS DISCLAIMER

This message may contain confidential, proprietary or legally Privileged information. In case you are not the original intended Recipient of the message, you must not, directly or indirectly, use, Disclose, distribute, print, or copy any part of this message and you are requested to delete it and inform the sender. Any views expressed in this message are those of the individual sender unless otherwise stated. Nothing contained in this message shall be construed as an offer or acceptance of any offer by Sasken Communication Technologies Limited ("Sasken") unless sent with that express intent and with due authority of Sasken. Sasken accepts no liability for any loss or damage, which may be caused by viruses.

***********************************************************************

--=_IS_MIME_Boundary--
