Received: from bay101-dav18.bay101.hotmail.com ([64.4.56.90]:40226 "EHLO
	hotmail.com") by ftp.linux-mips.org with ESMTP id S8135602AbVKGSEZ
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Mon, 7 Nov 2005 18:04:25 +0000
Message-ID: <BAY101-DAV18ABC35208B50E0535A360D2650@phx.gbl>
From: "oski" <oski2001@hotmail.com>
Subject: Compiling a kernel for ibm z50
Date: Mon, 7 Nov 2005 18:07:42 -0000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <oski2001@hotmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20051107180742.FOmCauz2cm1MfE4A5AqHHewmB18x0yCDgha0NhXNiFk@z>

Hi,
I am still having problems when compiling thfe kernel.
I get an Error and the last lines are:
init/do_mounts.o: In function "mount_root"
do_mounts.c: (.text.init+0x7e8): undefined reference to "ip_auto_config"
do_mounts.c: (.text.init+0x7e8): relocation truncated to fit:R_MIPS_26
against "ip_auto_config"
make: *** (vmlinux) Error 1

Any suggestions?

Many tks

oski
