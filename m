Received: from mail.zeugmasystems.com ([192.139.122.66]:65209 "EHLO
	zeugmasystems.com") by ftp.linux-mips.org with ESMTP
	id S20038894AbWKACJE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Wed, 1 Nov 2006 02:09:04 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: Cannot run N32 binaries.
Date: Tue, 31 Oct 2006 18:08:56 -0800
Message-ID: <66910A579C9312469A7DF9ADB54A8B7D44D290@exchange.ZeugmaSystems.local>
From: "Kaz Kylheku" <kaz@zeugmasystems.com>
Return-Path: <kaz@zeugmasystems.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20061101020856.A7GHqX7sJ2Kevecu7sb3J35HLUBFEZa_U0jx2mUyR3o@z>

Before I start debugging this, I thought I'd poll the mailing list.

I've built an N32 root filesystem: all binaries and libs are "ELF 32-bit
N32 MSB MIPS-III ..."

The kernel (2.6.17.7, 64 bit) that I built does have:

CONFIG_MIPS32_N32=y

The filesystem doesn't boot: init cannot be found.
 
I copied the N32 filesystem into a subdirectory of an O32 filesystem in
order to have a look.

Basically, for any executable that I try to run, the error is: "No such
file or directory".
