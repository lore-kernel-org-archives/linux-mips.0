Received: from nivc-ms1.auriga.com ([80.240.102.146]:10871 "EHLO
        nivc-ms1.auriga.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27008858AbbCWOH4nQ040 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 23 Mar 2015 15:07:56 +0100
Message-ID: <55101D58.1050309@auriga.com>
Date: Mon, 23 Mar 2015 17:04:08 +0300
From: Aleksey Makarov <aleksey.makarov@auriga.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] MIPS: OCTEON: Add mach-cavium-octeon/mangle-port.h
References: <1426867920-7907-1-git-send-email-aleksey.makarov@auriga.com> <1426867920-7907-3-git-send-email-aleksey.makarov@auriga.com>
In-Reply-To: <1426867920-7907-3-git-send-email-aleksey.makarov@auriga.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <aleksey.makarov@auriga.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org
Cc: Paul Martin <paul.martin@codethink.co.uk>
Message-ID: <20150323140408.iBK4QF3lhg_JZVC-TTgLYlriOK7k1QkpWj-wohOm9-E@z>

> On Fri, Mar 20, 2015 at 07:11:57PM +0300, Aleksey Makarov wrote:
>> From: David Daney <david.daney@cavium.com>
>> 
>> Needed for little-endian ioport access.
>> This fixes NOR flash in little-endian mode
>> 
>> Signed-off-by: David Daney <david.daney@cavium.com>
>> Signed-off-by: Aleksey Makarov <aleksey.makarov@auriga.com>
>> ---
>>  .../include/asm/mach-cavium-octeon/mangle-port.h   | 74 
>> ++++++++++++++++++++++
> 
> This seems to be a new header file that's not used anywhere else.

arch/mips/include/asm/io.h:#include <mangle-port.h>

Also note the compiler flags:

-I./arch/mips/include/asm/mach-cavium-octeon -I./arch/mips/include/asm/mach-generic 

> I get the feeling that there should be at least another three patches
> in this series which have been omitted.
> 
> Certainly, the Octeon peripherals won't work with just the three part
> patch set presented here.

With these patches the cn7000 board boots in little-endian mode with 
all peripherials supported on this board working fine.  The peripherials
on other boards should probably be fixed separately.

> PS. Don't forget the missing htons() in drivers/staging/octeon/ethernet-tx.c

Thanks.  A patch would be appreciated.

Thanks
Aleksey Makarov
