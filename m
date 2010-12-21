Received: from mail3.caviumnetworks.com ([12.108.191.235]:12580 "EHLO
        mail3.caviumnetworks.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1491758Ab0LUWTX (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 21 Dec 2010 23:19:23 +0100
From: David Daney <ddaney@caviumnetworks.com>
Subject: [PATCH v2 0/3] Allow processors with scratch registers to use them for TLB refill.
Date: Tue, 21 Dec 2010 14:19:08 -0800
Message-ID: <1292969951-11418-1-git-send-email-ddaney@caviumnetworks.com>
Return-Path: <David.Daney@caviumnetworks.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
To: linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: David Daney <ddaney@caviumnetworks.com>
Message-ID: <20101221221908.Rz5b0PPMAl3cUPRX0PV59GNt27JHDyGguFlMLbS1RLU@z>

v2: Declare pgd_current for mipsr1 and mips32 builds.

This other patch set:

http://www.linux-mips.org/cgi-bin/mesg.cgi?a=linux-mips&i=1292889290-12849-1-git-send-email-ddaney%40caviumnetworks.com

Should still be applied *after* this one.
