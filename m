Received: from smtp3.infineon.com ([203.126.106.229]:60733 "EHLO
	smtp3.infineon.com") by ftp.linux-mips.org with ESMTP
	id S20021450AbXGQLEm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 17 Jul 2007 12:04:42 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
Subject: linux-2.6.20 setjmp/longjmp OR how to contain bus-error for non-existing PCI device during PCI device scan?
Date: Tue, 17 Jul 2007 19:03:34 +0800
Message-ID: <31E09F73562D7A4D82119D7F6C172986019B76D7@sinse303.ap.infineon.com>
From: <KokHow.Teh@infineon.com>
Return-Path: <KokHow.Teh@infineon.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20070717110334.o4uOQN568ziWTcr3AvkLmmsb17r2VWyDC9Z0nG3EZko@z>

Hi;
   I am using linux-2.6.20 on MIPS24KE and I need to know what is the best way to contain bus error during PCI bus scan process for non-existing device? I thought of setjmp/longjmp but unfortunately, I have `googled` and `find` the whole kernel source tree there is no such support in the kernel for MIPS architecture. Any insight is appreciated.
 
Regards,
Kok How
