Received: from bay101-dav7.bay101.hotmail.com ([64.4.56.79]:47440 "EHLO
	hotmail.com") by ftp.linux-mips.org with ESMTP id S8133750AbVI0RVc
	(ORCPT <rfc822;linux-mips@linux-mips.org>);
	Tue, 27 Sep 2005 18:21:32 +0100
Message-ID: <BAY101-DAV76EF721B0CFCE85875AC3D28A0@phx.gbl>
From: "oski" <oski2001@hotmail.com>
Subject: Compiling a kernel for ibm z50
Date: Tue, 27 Sep 2005 18:19:51 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <oski2001@hotmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050927171951.buSk65Kht6FRbMACxpLrnmP-sfJkhLFTe7N_P54R_jo@z>



Hi,

I am a newbie trying to compile a kernel for my z50 and up to now failed.

This is my set up:
-An old Pentium II box with Redhat 8
-Downloaded linux-2.6.13.mipscvs-20050904 from www.longlandclan...and bzip2
and tar into /usr/src.
-Installed the mipsel crosscompiler from MIPS SDE
-After make config, when trying to make dep, I get a warning: make dep is
unnecessary now.
-Doing a ls arch/mips/boot I get a file called "compressed" with only a
folder called "CVS" .
 Questions:
1.Can somebody tell me what I am doing wrong?
2.Give me some advise on the proper way to crosscompile?
3.Has somebody a compiled kernel (and root) that will be willing to share
with me, to boot using hpcboot?

Many thanks

oski
