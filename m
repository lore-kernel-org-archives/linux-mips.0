Received: from smtp2.infineon.com ([217.10.60.23]:14027 "EHLO
        smtp2.infineon.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S1903646Ab2CNJKc convert rfc822-to-8bit (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 14 Mar 2012 10:10:32 +0100
Received: from MUCSE595.eu.infineon.com (mucse595.eu.infineon.com [172.23.7.84])
        by mucxv003.muc.infineon.com (Postfix) with ESMTPS
        for <linux-mips@linux-mips.org>; Wed, 14 Mar 2012 10:10:25 +0100 (CET)
From: <Narendra.Puttaswamy@lantiq.com>
Subject: Sys exception behavior
Date: Wed, 14 Mar 2012 09:10:20 +0000
Message-ID: <93D430A75FD60048911C7ED0A8F56E830AF688@MUCSE501.eu.infineon.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org
Message-ID: <20120314091020.hjWRJdMTZW7kpwGALIbo5dsoKGApQQMTm_TFBS_z-hg@z>


Soon after "syscall" instruction is executed in the user mode, does the processor ensure that it raises an exception with the appropriate exception code (sys)  set in Cause register *irrespective* of other high priority exception (for example, an interrupt) that may have occurred at that time.

Looking into the source code of scall32-o32.S file, I infer the above. Can somebody please confirm the behavior?
