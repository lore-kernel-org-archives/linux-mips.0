Received: from fw01.bwg.de (localhost [127.0.0.1])
	by fw01.bwg.de (8.11.6p2G/8.11.6) with ESMTP id j0RA2NI26886
	for <linux-mips@linux-mips.org>; Thu, 27 Jan 2005 11:02:23 +0100 (CET)
Received: from ximap.arbeitsgruppe (80.131.188.248)
          by mail.bwg.de with MERCUR Mailserver (v4.03.06 MTA4LTIzMDQtNDg3Ng==)
          for <linux-mips@linux-mips.org>; Thu, 27 Jan 2005 11:03:12 +0100
Received: from rr2600 (rr-2600 [192.168.178.44])
	by ximap.arbeitsgruppe (Postfix) with SMTP id D826B174B2E
	for <linux-mips@linux-mips.org>; Thu, 27 Jan 2005 11:02:11 +0100 (CET)
From: =?iso-8859-1?Q?Ralf_R=F6sch?= <ralf.roesch@rw-gmbh.de>
Subject: Compiler erros in process.c
Date: Thu, 27 Jan 2005 11:02:49 +0100
Message-ID: <NHBBLBCCGMJFJIKAMKLHEEKACCAA.ralf.roesch@rw-gmbh.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-Path: <ralf.roesch@rw-gmbh.de>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org
Message-ID: <20050127100249.qZA-Izd8n3OtEThTJBKw0vQALa5NQy-5r13Ef3F-ZGc@z>

The last commit of process.c (version 1.73, 2.6)
results in compiler errors on my system:

arch/mips/kernel/process.c: In function `dump_regs':
arch/mips/kernel/process.c:169: error: `EF_CP0_EPC' undeclared (first use in
thi
s function)
arch/mips/kernel/process.c:169: error: (Each undeclared identifier is
reported o
nly once
arch/mips/kernel/process.c:169: error: for each function it appears in.)
arch/mips/kernel/process.c:170: error: `EF_CP0_BADVADDR' undeclared (first
use i
n this function)
arch/mips/kernel/process.c:171: error: `EF_CP0_STATUS' undeclared (first use
in
this function)
arch/mips/kernel/process.c:172: error: `EF_CP0_CAUSE' undeclared (first use
in t
his function)
make[1]: *** [arch/mips/kernel/process.o] Error 1
make: *** [arch/mips/kernel] Error 2

I could not find 'EF_CP0_EPC' in the entire source tree.

Regards
  Ralf Roesch
