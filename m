Received: from david.siemens.com.cn ([194.138.202.53]:3809 "EHLO
	david.siemens.com.cn") by ftp.linux-mips.org with ESMTP
	id S20038753AbWLCJPV convert rfc822-to-8bit (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Sun, 3 Dec 2006 09:15:21 +0000
Received: from ns.siemens.com.cn (ns.siemens.com.cn [194.138.237.52])
	by david.siemens.com.cn (8.11.7/8.11.7) with ESMTP id kB39FCJ10774
	for <linux-mips@linux-mips.org>; Sun, 3 Dec 2006 17:15:17 +0800 (CST)
Received: from pekw905a.cn001.siemens.net (localhost [127.0.0.1])
	by ns.siemens.com.cn (8.11.7/8.11.7) with ESMTP id kB39FA111959
	for <linux-mips@linux-mips.org>; Sun, 3 Dec 2006 17:15:12 +0800 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Subject: The difference between mips*-gnu and mips*-linux when configure tool-chain
Date: Sun, 3 Dec 2006 17:15:07 +0800
Message-ID: <96E7D5519FC3D741BEE27AB88C7387970162312C@PEKW934A.cn001.siemens.net>
From: "Fu, He Wei PSE NKG" <hewei.fu@siemens.com>
Return-Path: <hewei.fu@siemens.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20061203091507.T6iGWL8CHkj8XlhoHJPbp6DEShFxPHRrV0AUe1UK34o@z>

Hello everyone.At the time of building tool-chain for mips machine,we
can choose mips*-gnu or mips*-linux, I want to know what's the
difference between them? The original idea is that mips*-gnu for
developing firmware which has not OS-surport, and mips*-linux for
developing software on Linux, but it is not suitable for firmware such
as bootloaders.But now I think I'm not right,it seems that configure
with mips*-linux suit for both linux and bootloader, and configure with
mips*-gnu means build for OS such as IRIX surport, I'm not very
clearly,can anybody help me figour out the difference between them?
Thanks
