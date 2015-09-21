Received: from mail.windriver.com ([147.11.1.11]:61291 "EHLO
        mail.windriver.com" rhost-flags-OK-OK-OK-OK) by eddie.linux-mips.org
        with ESMTP id S27006916AbbIUCXZR0U4i (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Mon, 21 Sep 2015 04:23:25 +0200
Message-ID: <55FF6A21.7030601@windriver.com>
Date: Mon, 21 Sep 2015 10:23:29 +0800
From: yjin <yanjiang.jin@windriver.com>
MIME-Version: 1.0
Subject: Re: [PATCH] mips: vmcore: forced convert 'hdr' in elf_check_arch()
References: <1442562171-21307-1-git-send-email-yanjiang.jin@windriver.com> <1442562171-21307-2-git-send-email-yanjiang.jin@windriver.com> <55FF6876.7080908@windriver.com>
In-Reply-To: <55FF6876.7080908@windriver.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-Path: <Yanjiang.Jin@windriver.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: ralf@linux-mips.org
Cc: akpm@linux-foundation.org, mhuang@redhat.com, kexec@lists.infradead.org, chaowang@redhat.com, linux-kernel@vger.kernel.org, jinyanjiang@gmail.com, linux-mips@linux-mips.org
Message-ID: <20150921022329.MTynLUtm5AkiAzhqLvizjDjUW7qAn5TwWPQzg6Sdj-I@z>

It seems the last mail has been blocked, resend it.

On 2015年09月21日 10:16, yjin wrote:
> The new version patch only modifies mips/elf.h, so add Ralf Baechle 
> and cc linux-mips@linux-mips.org.
> This is a V2 patch, attach the V1 patch for reference.
>
> Thanks!
> Yanjiang
>
> On 2015年09月18日 15:42, yanjiang.jin@windriver.com wrote:
>> From: Yanjiang Jin <yanjiang.jin@windriver.com>
>>
>> elf_check_arch() will be called both in parse_crash_elf64_headers()
>> and parse_crash_elf32_headers(). But in these two functions, the type of
>> the parameter ehdr is different: Elf32_Ehdr and Elf64_Ehdr.
>>
>> Function parse_crash_elf_headers() reads e_ident[EI_CLASS] then 
>> decides to
>> call parse_crash_elf64_headers() or parse_crash_elf32_headers().
>> This happens in run time, not compile time. So compiler will report
>> the below warning:
>>
>> In file included from include/linux/elf.h:4:0,
>>                   from fs/proc/vmcore.c:13:
>> fs/proc/vmcore.c: In function 'parse_crash_elf32_headers':
>> arch/mips/include/asm/elf.h:258:23: warning: initializatio
>> n from incompatible pointer type
>>    struct elfhdr *__h = (hdr);     \
>>                         ^
>> fs/proc/vmcore.c:1071:4: note: in expansion of macro 'elf_
>> check_arch'
>>     !elf_check_arch(&ehdr) ||
>>      ^
>>
>> Signed-off-by: Yanjiang Jin <yanjiang.jin@windriver.com>
>> ---
>>   arch/mips/include/asm/elf.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/mips/include/asm/elf.h b/arch/mips/include/asm/elf.h
>> index f19e890..ece490d 100644
>> --- a/arch/mips/include/asm/elf.h
>> +++ b/arch/mips/include/asm/elf.h
>> @@ -224,7 +224,7 @@ struct mips_elf_abiflags_v0 {
>>   #define elf_check_arch(hdr)                        \
>>   ({                                    \
>>       int __res = 1;                            \
>> -    struct elfhdr *__h = (hdr);                    \
>> +    struct elfhdr *__h = (struct elfhdr *)(hdr);            \
>>                                       \
>>       if (__h->e_machine != EM_MIPS)                    \
>>           __res = 0;                        \
>> @@ -255,7 +255,7 @@ struct mips_elf_abiflags_v0 {
>>   #define elf_check_arch(hdr)                        \
>>   ({                                    \
>>       int __res = 1;                            \
>> -    struct elfhdr *__h = (hdr);                    \
>> +    struct elfhdr *__h = (struct elfhdr *)(hdr);            \
>>                                       \
>>       if (__h->e_machine != EM_MIPS)                    \
>>           __res = 0;                        \
>
