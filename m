Received: from mailapp01.imgtec.com ([195.59.15.196]:55764 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27007864AbaLSItLTIBYh (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Fri, 19 Dec 2014 09:49:11 +0100
Message-ID: <5493E680.9020505@imgtec.com>
Date: Fri, 19 Dec 2014 08:49:04 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH RFC 01/67] MIPS: Add generic QEMU R6 PRid and cpu type
 identifiers
References: <1418915416-3196-1-git-send-email-markos.chandras@imgtec.com> <1418915416-3196-2-git-send-email-markos.chandras@imgtec.com> <549326BF.7050605@gmail.com>
In-Reply-To: <549326BF.7050605@gmail.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-Path: <Markos.Chandras@imgtec.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: David Daney <ddaney.cavm@gmail.com>
Cc: linux-mips@linux-mips.org, Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Message-ID: <20141219084904.A8PhMn6AlH7OvLmMNQd_VWcL3uIs3w28lSDPHNA1PAU@z>

On 12/18/2014 07:10 PM, David Daney wrote:
> On 12/18/2014 07:09 AM, Markos Chandras wrote:
>> From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
>>
>> Latest versions of QEMU added support for mips32r6-generic and
>> mips64r6-generic cpu types so add related definitions in preparation
>> of MIPS R6 support.
>>
>> Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> ---
>>   arch/mips/include/asm/cpu.h | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
>> index dfdc77ed1839..23a5dbc0ee06 100644
>> --- a/arch/mips/include/asm/cpu.h
>> +++ b/arch/mips/include/asm/cpu.h
>> @@ -93,6 +93,7 @@
>>    * These are the PRID's for when 23:16 == PRID_COMP_MIPS
>>    */
>>
>> +#define PRID_IMP_QEMUR6        0x0000
> 
> Why not have a value for a real R6 CPU, and then have QEMU emulate that?

because qemu does not implement real r6 cores at the moment. It uses
mips{32,64}r6-generic in order to get a minimal r6 core and that cpu
uses IMP=0. so that's the only thing we can use at the moment.

-- 
markos
