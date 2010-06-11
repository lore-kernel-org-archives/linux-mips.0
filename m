Received: from bby1mta03.pmc-sierra.com ([216.241.235.118]:58526 "EHLO
        bby1mta03.pmc-sierra.bc.ca" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S1492143Ab0FKOGN convert rfc822-to-8bit
        (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Fri, 11 Jun 2010 16:06:13 +0200
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Subject: 
Date: Fri, 11 Jun 2010 07:06:07 -0700
Message-ID: <BE430C874DBA6841A75E65151DCC6E1C0407668F@BBY1EXM11.pmc_nt.nt.pmc-sierra.bc.ca>
From: "Jabir M" <Jabir_M@pmc-sierra.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
Return-Path: <linux-mips-bounce@linux-mips.org>
To: linux-mips@linux-mips.org
Cc: ralf@linux-mips.org
Message-ID: <20100611140607.s299yxLMlGBa2Wmghpk7CxUzUbznwHULLDR289gpowM@z>


Hi,

    I am working on a FPU-less 34k MIPS platform with linux-2.6.24
kernel. After running a Darwin media streaming server on the board
for a while, my oprofile results shows high utilization on
fpu_emulator_cop1Handler() & r4k_wait().

wiki page http://www.linux-mips.org/wiki/Floating_point says gcc will
use hard float as default and soft float is best suited model for a
fpu less processor.  Could anyone kindly help me in understanding use
of -msoft-float .
Whether I need to compile

1. kernel with -msoft-float ? or
2. Glibc ? or
3. Application ? or
4. All the above ?

Thanks in Advance

Jabir
