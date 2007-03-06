Received: from krt.tmd.ns.ac.yu ([147.91.177.65]:52629 "HELO krt.neobee.net")
	by ftp.linux-mips.org with SMTP id S20021350AbXCFI7x (ORCPT
	<rfc822;linux-mips@linux-mips.org>); Tue, 6 Mar 2007 08:59:53 +0000
Received: from localhost (localhost [127.0.0.1])
	by krt.neobee.net (Postfix) with ESMTP id E19C7278040
	for <linux-mips@linux-mips.org>; Tue,  6 Mar 2007 09:59:22 +0100 (CET)
Received: from krt.neobee.net ([127.0.0.1])
	by localhost (krt.neobee.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hNFLOumUtyZn for <linux-mips@linux-mips.org>;
	Tue,  6 Mar 2007 09:59:22 +0100 (CET)
Received: from had (unknown [192.168.193.90])
	by krt.neobee.net (Postfix) with ESMTP id CAE52278031
	for <linux-mips@linux-mips.org>; Tue,  6 Mar 2007 09:59:21 +0100 (CET)
From: "Mile Davidovic" <Mile.Davidovic@micronasnit.com>
References: <20070305162826.GC786@linux-mips.org>
In-Reply-To: <20070305162826.GC786@linux-mips.org>
Subject: RE: Encrypt user file system
Date: Tue, 6 Mar 2007 10:02:13 +0100
Message-ID: <023501c75fce$21c37db0$654a7910$@Davidovic@micronasnit.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
Content-Language: sr
Return-Path: <Mile.Davidovic@micronasnit.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20070306090213.Yxa8bRHGlMhFD9XpWFUD3OUWre4V4A7lheBpecUBTVQ@z>

Thanks a lot, it make sense. But my question is not precise, 
I am wonder if MTD block device could be encrypted with dm-crypt.
But this is questions for MTD mailing list.

Best regards Mile


But if I want to crypt MTD device 
> 
> > What is mips way for encrypting user file system?
> > On intel we can use combination dm-crypt and we could crypt complete user
> FS I
> > suppose that should work on MIPS too?
> 
> Yes, of course.
> 
>   Ralf
