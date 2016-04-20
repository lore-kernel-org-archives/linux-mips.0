Received: from mail-io0-f195.google.com ([209.85.223.195]:34530 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK)
        by eddie.linux-mips.org with ESMTP id S27026390AbcDTGS0y-MJ4 (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 20 Apr 2016 08:18:26 +0200
Received: by mail-io0-f195.google.com with SMTP id z133so5649206iod.1
        for <linux-mips@linux-mips.org>; Tue, 19 Apr 2016 23:18:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADnq5_OyS_pCu-4wW5uFpnr5kvqkHK5uPdmBKgHHmfZ-dOdXvw@mail.gmail.com>
References: <1461064751-17873-1-git-send-email-chenhc@lemote.com>
        <CADnq5_OyS_pCu-4wW5uFpnr5kvqkHK5uPdmBKgHHmfZ-dOdXvw@mail.gmail.com>
Date: Wed, 20 Apr 2016 14:18:20 +0800
Message-ID: <CAAhV-H6EsxUhuXAAYBhun-S4+tM-xhWxKbXD4Jg0btK4sLfjGg@mail.gmail.com>
Subject: Re: [PATCH] drm: Loongson-3 doesn't fully support wc memory
From: Huacai Chen <chenhc@lemote.com>
Content-Type: text/plain; charset=UTF-8
Return-Path: <chenhuacai@gmail.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alex Deucher <alexdeucher@gmail.com>, stable <stable@vger.kernel.org>
Cc: Linux MIPS Mailing List <linux-mips@linux-mips.org>, Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Message-ID: <20160420061820.eGst3ErAFH7rijePXT0w55rzbz4cMc-Al91DtK0VekM@z>

Cc: stable@vger.kernel.org

On Tue, Apr 19, 2016 at 9:53 PM, Alex Deucher <alexdeucher@gmail.com> wrote:
> On Tue, Apr 19, 2016 at 7:19 AM, Huacai Chen <chenhc@lemote.com> wrote:
>> Signed-off-by: Huacai Chen <chenhc@lemote.com>
>
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>
>> ---
>>  include/drm/drm_cache.h | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
>> index 461a055..cebecff 100644
>> --- a/include/drm/drm_cache.h
>> +++ b/include/drm/drm_cache.h
>> @@ -39,6 +39,8 @@ static inline bool drm_arch_can_wc_memory(void)
>>  {
>>  #if defined(CONFIG_PPC) && !defined(CONFIG_NOT_COHERENT_CACHE)
>>         return false;
>> +#elif defined(CONFIG_MIPS) && defined(CONFIG_CPU_LOONGSON3)
>> +       return false;
>>  #else
>>         return true;
>>  #endif
>> --
>> 2.7.0
>>
>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
