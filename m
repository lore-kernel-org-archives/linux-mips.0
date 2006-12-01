Received: from mail.zeugmasystems.com ([192.139.122.66]:19280 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S28573767AbWLAXpK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Fri, 1 Dec 2006 23:45:10 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: RE: Trouble with System V IPC on n32.
Date: Fri, 1 Dec 2006 15:45:03 -0800
Message-ID: <66910A579C9312469A7DF9ADB54A8B7D4B5F42@exchange.ZeugmaSystems.local>
From: "Kaz Kylheku" <kaz@zeugmasystems.com>
Return-Path: <kaz@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20061201234503.aOY1TJ7QCFN7N6K4-isBG3eCboOTfaI3xD9aWK_d9pg@z>

My guess was wrong. The call is going through sys32_shmat.

Inside this function, the put_user call is returning -14/EFAULT.
