Received: from eastrmmtao01.cox.net ([68.230.240.38]:56562 "HELO
	eastrmmtao01.cox.net") by ftp.linux-mips.org with SMTP
	id S8127173AbWENNvK (ORCPT <rfc822;linux-mips@linux-mips.org>);
	Sun, 14 May 2006 15:51:10 +0200
Received: from hermes.mountolympos.net ([70.160.186.45])
          by eastrmmtao01.cox.net
          (InterMail vM.6.01.06.01 201-2131-130-101-20060113) with ESMTP
          id <20060514135102.VCNU17255.eastrmmtao01.cox.net@hermes.mountolympos.net>
          for <linux-mips@linux-mips.org>; Sun, 14 May 2006 09:51:02 -0400
Received: from zeus.mountolympos.net (zeus.mountolympos.net [192.168.2.2])
	by hermes.mountolympos.net (Postfix) with ESMTP id 5BC1C1677D
	for <linux-mips@linux-mips.org>; Sun, 14 May 2006 09:51:02 -0400 (EDT)
Received: from [192.168.2.3] (kronos.mountolympos.net [192.168.2.3])
	by zeus.mountolympos.net (Postfix) with ESMTP id 494AF100A118
	for <linux-mips@linux-mips.org>; Sun, 14 May 2006 09:51:02 -0400 (EDT)
Message-ID: <446735C6.2080306@mountolympos.net>
Date: Sun, 14 May 2006 09:51:02 -0400
From: John Miller <jamiller1110@cox.net>
MIME-Version: 1.0
Subject: Instruction error with cache opcode
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-Path: <jamiller1110@cox.net>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20060514135102.ZmnkCGTukk0UazjpXJT-nU6OJRw_E0Pqxgu0M2PHuoA@z>

I am attempting to write a routine to initialize the cache for a MIPS
4kc core to get Linux 2.6.16.14 to compile.  I am sure someone has
probably already done this, but I am doing it for educational reasons. 
I am receiving the following error:

arch/mips/kernel/head.S: Assembler messages:
arch/mips/kernel/head.S:131: Error: Instruction cache requires absolute
expression
