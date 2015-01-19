Received: from mailapp01.imgtec.com ([195.59.15.196]:62571 "EHLO
        mailapp01.imgtec.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27011794AbbASMfuCenyE (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 19 Jan 2015 13:35:50 +0100
Message-ID: <54BCFA1F.8060101@imgtec.com>
Date: Mon, 19 Jan 2015 12:35:43 +0000
From: Markos Chandras <Markos.Chandras@imgtec.com>
MIME-Version: 1.0
Subject: Re: [PATCH RFC v2 05/70] MIPS: mm: uasm: Add signed 9-bit immediate
 related macros
References: <1421405389-15512-1-git-send-email-markos.chandras@imgtec.com> <1421405389-15512-6-git-send-email-markos.chandras@imgtec.com> <54B8F609.90509@cogentembedded.com>
In-Reply-To: <54B8F609.90509@cogentembedded.com>
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
Cc: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
Message-ID: <20150119123543.-QtnSifH5NINO5j-aEA8fvGL5f-bbqOT6xqBz-d58EY@z>

On 01/16/2015 11:29 AM, Sergei Shtylyov wrote:
> Hello.
> 
> On 1/16/2015 1:48 PM, Markos Chandras wrote:
> 
>> From: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
> 
>> MIPS R6 redefines several instructions and reduces the immediate
>> field to 9-bits so add related macros for the microassembler.
> 
>> Signed-off-by: Leonid Yegoshin <Leonid.Yegoshin@imgtec.com>
>> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
>> ---
>>   arch/mips/mm/uasm.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
>> diff --git a/arch/mips/mm/uasm.c b/arch/mips/mm/uasm.c
>> index 4adf30284813..6596b6898637 100644
>> --- a/arch/mips/mm/uasm.c
>> +++ b/arch/mips/mm/uasm.c
> [...]
>> @@ -41,6 +42,8 @@ enum fields {
>>   #define FUNC_SH        0
>>   #define SET_MASK    0x7
>>   #define SET_SH        0
>> +#define SIMM9_SH    7
>> +#define SIMM9_MASK    0x1ff
>>
>>   enum opcode {
>>       insn_invalid,
>> @@ -116,6 +119,14 @@ static inline u32 build_scimm(u32 arg)
>>       return (arg & SCIMM_MASK) << SCIMM_SH;
>>   }
>>
>> +static inline u32 build_scimm9(s32 arg)
>> +{
>> +    WARN((arg > 0x1ff || arg < -0x200),
> 
>    Not 0xFF and -0x100? The values above don't fit into 9 bits...

Hi,

I think 0x1ff and -0x200 fit into 9-bits. Why do you think they don't?

-- 
markos
