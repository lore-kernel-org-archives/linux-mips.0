Received: from mailapp01.imgtec.com ([195.59.15.196]:38541 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27009999AbbGIQFgUum3m (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Thu, 9 Jul 2015 18:05:36 +0200
Subject: Re: [PATCH 05/19] MIPS: asm: mips-cm: Implement mips_cm_revision
References: <1436434853-30001-1-git-send-email-markos.chandras@imgtec.com>
 <1436434853-30001-6-git-send-email-markos.chandras@imgtec.com>
 <559E5662.3010800@cogentembedded.com>
From: Markos Chandras <Markos.Chandras@imgtec.com>
Message-ID: <559E9BC9.5050700@imgtec.com>
Date: Thu, 9 Jul 2015 17:05:29 +0100
MIME-Version: 1.0
In-Reply-To: <559E5662.3010800@cogentembedded.com>
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
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-mips@linux-mips.org
Cc: Paul Burton <paul.burton@imgtec.com>
Message-ID: <20150709160529.3uKwuxz3d5gl9t7_dlB9nLWJAh7Lw71FU4tK7EJJuWE@z>

On 07/09/2015 12:09 PM, Sergei Shtylyov wrote:
> On 7/9/2015 12:40 PM, Markos Chandras wrote:
> 
>> From: Paul Burton <paul.burton@imgtec.com>
> 
>> Provide a function to trivially return the version of the CM present in
>> the system, or 0 if no CM is present. The mips_cm_revision() will be
>> used later on to determine the CM register width, so it must not use
>> the regular CM accessors to read the revision register since that will
>> lead to build failures due to recursive inlines.
> 
>> Signed-off-by: Paul Burton <paul.burton@imgtec.com>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> ---
>>   arch/mips/include/asm/mips-cm.h | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
> 
>> diff --git a/arch/mips/include/asm/mips-cm.h
>> b/arch/mips/include/asm/mips-cm.h
>> index edc7ee95269e..29ff74a629f6 100644
>> --- a/arch/mips/include/asm/mips-cm.h
>> +++ b/arch/mips/include/asm/mips-cm.h
>> @@ -189,6 +189,13 @@ BUILD_CM_Cx_R_(tcid_8_priority,    0x80)
>>   #define CM_GCR_REV_MINOR_SHF            0
>>   #define CM_GCR_REV_MINOR_MSK            (_ULCAST_(0xff) << 0)
>>
>> +#define CM_ENCODE_REV(major, minor) \
>> +        ((major << CM_GCR_REV_MAJOR_SHF) | \
>> +         ((minor) << CM_GCR_REV_MINOR_SHF))
> 
>    Enclosing 'minor' into parens and not enclosing 'major' doesn't look
> very consistent... :-)

Ok I will fix it

> 
> [...]
>> @@ -324,4 +331,26 @@ static inline int mips_cm_l2sync(void)
>>       return 0;
>>   }
>>
>> +/**
>> + * mips_cm_revision - return CM revision
>> + *
>> + * Returns the revision of the CM, from GCR_REV, or 0 if no CM is
>> present.
>> + * The return value should be checked against the CM_REV_* macros.
>> + */
>> +static inline int mips_cm_revision(void)
>> +{
>> +    static int mips_cm_revision_nr = -1;
> 
>    Won't this variable be allocated per source file (including this
> header)?

I will drop the static variable since the implementation changed
overtime and there is no need to call mips_cm_revision() so often anymore.


-- 
markos
