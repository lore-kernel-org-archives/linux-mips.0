Received: from mail-by2nam01on0084.outbound.protection.outlook.com ([104.47.34.84]:32096
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23993349AbcLUSIYd0mVh (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 21 Dec 2016 19:08:24 +0100
Subject: Re: [PATCH 1/5] MIPS: FW: Make fw_init_cmdline() to be __weak.
References: <b14ef49d-f39c-4e13-2da8-ab94804395a2@cavium.com>
 <20161221171015.GA13689@linux-mips.org>
From: David Daney <ddaney@caviumnetworks.com>
Message-ID: <892fff47-d83e-fbb5-92a5-248d6e3a3eea@caviumnetworks.com>
Date: Wed, 21 Dec 2016 10:08:11 -0800
MIME-Version: 1.0
In-Reply-To: <20161221171015.GA13689@linux-mips.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Ralf Baechle <ralf@linux-mips.org>, "Steven J. Hill" <Steven.Hill@cavium.com>
Cc: linux-mips@linux-mips.org
Message-ID: <20161221180811.xjvbUQ5rqufeCcIG6uHrbWrFLu_Pp0SmskzzWIkfXkc@z>

On 12/21/2016 09:10 AM, Ralf Baechle wrote:
> On Tue, Nov 22, 2016 at 01:43:54PM -0600, Steven J. Hill wrote:
>
>> Some bootloaders pass the kernel parameters in different registers.
>> Allow for platform-specific initialization of the command line.
>>
>> Signed-off-by: Steven J. Hill <Steven.Hill@cavium.com>
>> ---
>>  arch/mips/include/asm/fw/fw.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/mips/include/asm/fw/fw.h b/arch/mips/include/asm/fw/fw.h
>> index d0ef8b4..0fcd63e 100644
>> --- a/arch/mips/include/asm/fw/fw.h
>> +++ b/arch/mips/include/asm/fw/fw.h
>> @@ -21,7 +21,7 @@
>>  #define fw_argv(index)		((char *)(long)_fw_argv[(index)])
>>  #define fw_envp(index)		((char *)(long)_fw_envp[(index)])
>>
>> -extern void fw_init_cmdline(void);
>> +extern void __weak fw_init_cmdline(void);
>>  extern char *fw_getcmdline(void);
>>  extern void fw_meminit(void);
>>  extern char *fw_getenv(char *name);
>
> Nice try - expect it doesn't work.

Ralf,  Can you drop this unneeded patch, and still apply the other 
OCTEON KASLR patches in this set?

Thanks,
David Daney


>
> The definition of the function needs to be marked __weak; marking the
> declaration will only kindly express your wishes to GCC and it being
> GCC will ignore them ;-)
>
>   Ralf
>
